package com.youku.organs.rootview.view {
    import com.youku.base.BaseMediator;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.events.RootViewEvent;
    import com.youku.interfaces.IPlayerProxy;
    import com.youku.organs.rootview.view.components.RootView;
    
    import flash.display.Sprite;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class RootViewMediator extends BaseMediator {
        private var _rootView:RootView;
        
        public function RootViewMediator(mainSprite:Sprite, playerProxy:IPlayerProxy) {
            super(mainSprite, playerProxy);
            
            init();
        }
        
        public function init():void {
            _rootView = new RootView();
            _rootView.addEventListener(RootViewEvent.STAGE_RESIZE, stageResize);
            _mainSprite.addChild(_rootView);
        }
        
        private function stageResize(e:RootViewEvent):void {
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.ROOT_VIEW_MEDIATOR_STAGE_RESIZE, e.data));
        }
        
        public function resetResize():void {
            _rootView.stageResize();
        }
        
        protected function controlMediatorHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            switch (e.type) {
                /*case PlayerProxyEvent.CONTROL_MEDIATOR_FULL_SCREEN_CHANGE:  {
                    _rootView.changeDisplayState();
                    break;
                }*/
                default:  {
                    break;
                }
            }
        }
        
        override protected function initAddEventListener():void {
            super.initAddEventListener();
            //_playerProxy.addEventListener(PlayerProxyEvent.CONTROL_MEDIATOR_FULL_SCREEN_CHANGE, controlMediatorHandler);
        }
        
        override protected function stageSizeChange(e:PlayerProxyEvent):void {
            super.stageSizeChange(e);
            var sw:Number = e.data.stageWidth;
            var sh:Number = e.data.stageHeight;
            _rootView.setSize(sw, sh);
        }
        
        public function get videoLayer():Sprite {
            return _rootView.videoLayer;
        }
        
        public function get adLayer():Sprite {
            return _rootView.adLayer;
        }
        
        public function get videoOverLayer():Sprite {
            return _rootView.videoOverLayer;
        }
        
        public function get pluginLayer():Sprite {
            return _rootView.pluginLayer;
        }
        
        public function get controlsLayer():Sprite {
            return _rootView.controlsLayer;
        }
        
        public function get background():Sprite {
            return _rootView.background;
        }
        
        public function get endCardLayer():Sprite {
            return _rootView.endCardLayer;
        }
    }
}
