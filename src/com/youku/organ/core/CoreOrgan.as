package com.youku.organ.core {
    import com.youku.PlayerConfig;
    import com.youku.base.BaseControler;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.organ.core.event.CoreEvent;
    import com.youku.organ.core.view.Core;
    import com.youku.proxys.PlayerProxy;
    
    import flash.display.Sprite;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class CoreOrgan extends BaseControler {
        private var _timer:Timer;
        
        private var _core:Core;
        
        public function CoreOrgan(mainSprite:Sprite, playerProxy:PlayerProxy) {
            super(mainSprite, playerProxy);
        
        }
        
        override protected function init(value:Object = null):void {
            super.init(value);
            _timer = new Timer(1000 / PlayerConfig.stage.frameRate);
            _timer.addEventListener(TimerEvent.TIMER, timerTimer);
            
            _core = new Core();
            _core.addEventListener(CoreEvent.SEEK_NOTIFY, coreHandler);
            _core.addEventListener(CoreEvent.SEEK_COMPLETE, coreHandler);
            _core.addEventListener(CoreEvent.PLAY_START, coreHandler);
            _core.addEventListener(CoreEvent.PLAY_STOP, coreHandler);
            _core.addEventListener(CoreEvent.BUFFER_FULL, coreHandler);
            _core.addEventListener(CoreEvent.BUFFER_EMPTY, coreHandler);
            _core.addEventListener(CoreEvent.STREAM_NOT_FOUND, coreHandler);
            
            _mainSprite.addChild(_core);
        
        }
        
        private function timerTimer(e:TimerEvent):void {
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.GOING, {time: currentTime}));
        }
        
        protected function coreHandler(e:CoreEvent):void {
            var data:Object = e.data;
            switch (e.type) {
                case CoreEvent.SEEK_NOTIFY:  {
                    _timer.stop();
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CORE_SEEK_NOTIFY, data));
                    break;
                }
                case CoreEvent.SEEK_COMPLETE:  {
                    _timer.reset();
                    _timer.start();
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CORE_SEEK_COMPLETE, data));
                    break;
                }
                case CoreEvent.PLAY_START:  {
                    _timer.reset();
                    _timer.start();
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CORE_PLAY_START, data));
                    break;
                }
                case CoreEvent.PLAY_STOP:  {
                    _timer.stop();
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CORE_PLAY_STOP, data));
                    break;
                }
                case CoreEvent.BUFFER_FULL:  {
                    _timer.reset();
                    _timer.start();
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CORE_BUFFER_FULL, data));
                    break;
                }
                case CoreEvent.BUFFER_EMPTY:  {
                    _timer.stop();
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CORE_BUFFER_EMPTY, data));
                    break;
                }
                case CoreEvent.STREAM_NOT_FOUND:  {
                    _timer.stop();
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CORE_STREAM_NOT_FOUND, data));
                    break;
                }
                default:  {
                    break;
                }
            }
        }
        
        public function get buffered():Number {
            return _core.buffered;
        }
        
        public function seek(value:Number):void {
            _core.currentTime(value);
        }
        
        public function get currentTime():Number {
            return _core.currentTime;
        }
        
        override protected function playerProxyHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            switch (e.type) {
                case PlayerProxyEvent.LayerControler_STAGE_RESIZE + PlayerProxy.ED:  {
                    stageSizeChange(e);
                    break;
                }
                case PlayerProxyEvent.PLAY + PlayerProxy.ED:  {
                    if (PlayerConfig.flashVars.autoplay == false) {
                        return;
                    }
                    _core.play(data.src ? data.src : PlayerConfig.flashVars.src);
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CHANGE_VOLUME, {volume: PlayerConfig.volume}));
                    break;
                }
                case PlayerProxyEvent.PAUSE + PlayerProxy.ED:  {
                    _core.pause(data);
                    break;
                }
                case PlayerProxyEvent.RESUME + PlayerProxy.ED:  {
                    _core.resume(data);
                    break;
                }
                case PlayerProxyEvent.SEEK + PlayerProxy.ED:  {
                    _core.seek(data.time);
                    break;
                }
                case PlayerProxyEvent.CHANGE_VOLUME + PlayerProxy.ED:  {
                    _core.changeVolume(data.volume);
                    break;
                }
                default:  {
                    break;
                }
            }
        }
        
        protected function controlMediatorHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            switch (e.type) {
                /*case PlayerProxyEvent.CONTROL_MEDIATOR_VOLUME_CHANGE:  {
                    _core.changeVolume(data.value);
                    break;
                } */
                default:  {
                    break;
                }
            }
        }
        
        override protected function addEventListeners():void {
            super.addEventListeners();
            _playerProxy.addEventListener(PlayerProxyEvent.PLAY + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.PAUSE + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.RESUME + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.SEEK + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CHANGE_VOLUME + PlayerProxy.ED, playerProxyHandler);
        
        }
        
        override protected function stageSizeChange(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            super.stageSizeChange(e);
            _core.setVideoSize(data.sw, data.sh);
        }
    }
}
