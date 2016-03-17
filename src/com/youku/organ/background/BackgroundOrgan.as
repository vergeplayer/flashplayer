package com.youku.organ.background {
    import com.youku.base.BaseControler;
    import com.youku.base.BaseEvent;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.organ.background.view.BackgroundView;
    import com.youku.proxys.PlayerProxy;
    
    import flash.display.Sprite;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class BackgroundOrgan extends BaseControler {
        private var _view:BackgroundView;
        
        public function BackgroundOrgan(mainSprite:Sprite, playerProxy:PlayerProxy) {
            super(mainSprite, playerProxy);
        
        }
        
        override protected function init(value:Object = null):void {
            super.init(value);
            _view = new BackgroundView();
            _mainSprite.addChild(_view);
        }
        
        override protected function viewEventHandler(e:BaseEvent):void {
            var data:Object = e.data;
            super.viewEventHandler(e);
            switch (e.type) {
                default:  {
                    break;
                }
            }
        }
        
        protected function get view():BackgroundView {
            return _view as BackgroundView;
        }
        
        override protected function addEventListeners():void {
            super.addEventListeners();
            //_playerProxy.addEventListener(PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE + PlayerProxy.ED, globalProxyEventHandler);
        
        }
        
        override protected function playerProxyHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            super.playerProxyHandler(e);
            switch (e.type) {
                case PlayerProxyEvent.LayerControler_STAGE_RESIZE + PlayerProxy.ED:  {
                    stageSizeChange(e);
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


