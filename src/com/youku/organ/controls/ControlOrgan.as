package com.youku.organ.controls {
    import com.youku.PlayerConfig;
    import com.youku.base.BaseControler;
    import com.youku.base.BaseEvent;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.organ.controls.event.ControlEvent;
    import com.youku.organ.controls.view.ControlView;
    import com.youku.proxys.PlayerProxy;
    
    import flash.display.Sprite;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class ControlOrgan extends BaseControler {
        private var _view:ControlView;
        
        public function ControlOrgan(mainSprite:Sprite, playerProxy:PlayerProxy) {
            super(mainSprite, playerProxy);
        
        }
        
        override protected function init(value:Object = null):void {
            super.init(value);
            _view = new ControlView();
            _view.addEventListener(ControlEvent.PAUSE, viewEventHandler);
            _view.addEventListener(ControlEvent.RESUME, viewEventHandler);
            _view.addEventListener(ControlEvent.SEEK, viewEventHandler);
            _view.addEventListener(ControlEvent.VOLUME_CHANGE, viewEventHandler);
            _view.addEventListener(ControlEvent.CHANGE_FULL_SCREEN, viewEventHandler);
            _mainSprite.addChild(_view);
        }
        
        override protected function viewEventHandler(e:BaseEvent):void {
            var data:Object = e.data;
            super.viewEventHandler(e);
            switch (e.type) {
                case ControlEvent.PAUSE:  {
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.PAUSE, data));
                    break;
                }
                case ControlEvent.RESUME:  {
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.RESUME, data));
                    break;
                }
                case ControlEvent.SEEK:  {
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.SEEK, data));
                    break;
                }
                case ControlEvent.VOLUME_CHANGE:  {
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CHANGE_VOLUME, data));
                    break;
                }
                case ControlEvent.CHANGE_FULL_SCREEN:  {
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE, data));
                    break;
                }
                default:  {
                    break;
                }
            }
        }
        
        protected function get view():ControlView {
            return _view as ControlView;
        }
        
        override protected function addEventListeners():void {
            super.addEventListeners();
            _playerProxy.addEventListener(PlayerProxyEvent.GOING + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.PLAY + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.PAUSE + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.RESUME + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.SEEK + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CHANGE_VOLUME + PlayerProxy.ED, playerProxyHandler);
        
        }
        
        protected function formatTime(t:Number):String {
            var min:* = int(t / 60);
            var sec:* = int(t - min * 60);
            if (min < 10) {
                min = "0" + min;
            }
            if (sec < 10) {
                sec = "0" + sec;
            }
            return min + ":" + sec;
        }
        
        override protected function playerProxyHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            super.playerProxyHandler(e);
            switch (e.type) {
                case PlayerProxyEvent.LayerControler_STAGE_RESIZE + PlayerProxy.ED:  {
                    stageSizeChange(e);
                    break;
                }
                case PlayerProxyEvent.GOING + PlayerProxy.ED:  {
                    _view.changeProgressBarMovieClipState(data.time / PlayerConfig.metaData.duration);
                    _view.changeProgressTextFieldState(formatTime(data.time));
                    break;
                }
                case PlayerProxyEvent.PLAY + PlayerProxy.ED:  {
                    _view.changePauseResumeMovieClipState("resume");
                    _view.changeProgressBarMovieClipState(0);
                    break;
                }
                case PlayerProxyEvent.PAUSE + PlayerProxy.ED:  {
                    _view.changePauseResumeMovieClipState("resume");
                    break;
                }
                case PlayerProxyEvent.RESUME + PlayerProxy.ED:  {
                    _view.changePauseResumeMovieClipState("pause");
                    break;
                }
                case PlayerProxyEvent.SEEK + PlayerProxy.ED:  {
                    _view.changeProgressBarMovieClipState(data.time / PlayerConfig.metaData.duration);
                    break;
                }
                case PlayerProxyEvent.CHANGE_VOLUME + PlayerProxy.ED:  {
                    _view.changeVolumeBarMovieClipState(data.volume);
                    break;
                }
                default:  {
                    break;
                }
            }
        }
        
        override protected function stageSizeChange(e:PlayerProxyEvent):void {
            super.stageSizeChange(e);
            _view.setSize(e.data);
        }
    
    }
}
