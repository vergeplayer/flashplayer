package com.youku.organ.layer {
    import com.youku.base.BaseEvent;
    import com.youku.base.BaseControler;
    import com.youku.events.LayerEvent;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.proxys.PlayerProxy;
    
    import flash.display.Sprite;
    import com.youku.organ.layer.view.LayerView;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class LayerOrgan extends BaseControler {
        private var _view:LayerView;
        
        public function LayerOrgan(mainSprite:Sprite, playerProxy:PlayerProxy) {
            super(mainSprite, playerProxy);
        
        }
        
        override protected function init(value:Object = null):void {
            super.init(value);
            _view = new LayerView();
            _view.addEventListener(LayerEvent.STAGE_RESIZE, viewEventHandler);
            _mainSprite.addChild(_view);
        }
        
        override protected function viewEventHandler(e:BaseEvent):void {
            var data:Object = e.data;
            super.viewEventHandler(e);
            switch (e.type) {
                case LayerEvent.STAGE_RESIZE:  {
                    _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.LayerControler_STAGE_RESIZE, e.data));
                    break;
                }
                default:  {
                    break;
                }
            }
        }
        
        protected function get view():LayerView {
            return _view as LayerView;
        }
        
        public function initResize():void {
            _view.stageResize();
        }
        
        override protected function addEventListeners():void {
            super.addEventListeners();
            _playerProxy.addEventListener(PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE + PlayerProxy.ED, playerProxyHandler);
        
        }
        
        override protected function playerProxyHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            super.playerProxyHandler(e);
            switch (e.type) {
                case PlayerProxyEvent.LayerControler_STAGE_RESIZE + PlayerProxy.ED:  {
                    stageSizeChange(e);
                    break;
                }
                case PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE + PlayerProxy.ED:  {
                    _view.changeDisplayState();
                    break;
                }
                default:  {
                    break;
                }
            }
        }
        
        override protected function stageSizeChange(e:PlayerProxyEvent):void {
            super.stageSizeChange(e);
            var sw:Number = e.data.stageWidth;
            var sh:Number = e.data.stageHeight;
            _view.setSize(e.data);
        }
        
        
        
        
        
        
        
        
        public function get background():Sprite {
            return _view.background;
        }
        
        public function get videoLayer():Sprite {
            return _view.videoLayer;
        }
        
        public function get videoOverLayer():Sprite {
            return _view.videoOverLayer;
        }
        
        public function get adLayer():Sprite {
            return _view.adLayer;
        }
        
        public function get pluginLayer():Sprite {
            return _view.pluginLayer;
        }
        
        public function get controlsLayer():Sprite {
            return _view.controlsLayer;
        }
        
        public function get endCardLayer():Sprite {
            return _view.endCardLayer;
        }
    }
}
