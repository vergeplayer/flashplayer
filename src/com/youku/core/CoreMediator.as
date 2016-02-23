package com.youku.core {
    import com.youku.PlayerConfig;
    import com.youku.base.BaseMediator;
    import com.youku.core.view.Core;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.proxys.PlayerProxy;
    
    import flash.display.Sprite;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class CoreMediator extends BaseMediator {
        
        private var _core:Core;
        
        public function CoreMediator(mainSprite:Sprite, playerProxy:PlayerProxy) {
            super(mainSprite, playerProxy);
            
            init();
        }
        
        private function init():void {
            _core = new Core();
            
            _mainSprite.addChild(_core);
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
        
        public function get duration():Number {
            return _core.duration;
        }
        
        private function playerProxyHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            switch (e.type) {
                case PlayerProxyEvent.PLAY + PlayerProxy.ED:  {
                    _core.play(data.src ? data.src : PlayerConfig.flashVars.src);
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
        
        override protected function initAddEventListener():void {
            super.initAddEventListener();
            _playerProxy.addEventListener(PlayerProxyEvent.PLAY + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.PAUSE + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.RESUME + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.SEEK + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CHANGE_VOLUME + PlayerProxy.ED, playerProxyHandler);
        }
        
        override protected function stageSizeChange(e:PlayerProxyEvent):void {
            super.stageSizeChange(e);
        }
    }
}
