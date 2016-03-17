package com.youku.base {
    import com.youku.events.PlayerProxyEvent;
    import com.youku.proxys.PlayerProxy;
    
    import flash.display.Sprite;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class BaseControler {
        protected var _mainSprite:Sprite;
        protected var _playerProxy:PlayerProxy;
        
        public function BaseControler(mainSprite:Sprite, playerProxy:PlayerProxy) {
            this._mainSprite = mainSprite;
            this._playerProxy = playerProxy;
            
            init();
        }
        
        protected function init(value:Object = null):void {
            addEventListeners();
        }
        
        protected function addEventListeners():void {
            if (_playerProxy) {
                _playerProxy.addEventListener(PlayerProxyEvent.LayerControler_STAGE_RESIZE + PlayerProxy.ED, playerProxyHandler);
            }
        }
        
        protected function removeEventListeners():void {
            if (_playerProxy) {
                _playerProxy.removeEventListener(PlayerProxyEvent.LayerControler_STAGE_RESIZE + PlayerProxy.ED, playerProxyHandler);
            }
        }
        
        protected function playerProxyHandler(e:PlayerProxyEvent):void {
            //子类重写
        }
        
        protected function stageSizeChange(e:PlayerProxyEvent):void {
            //子类重写
        }
        
        protected function viewEventHandler(e:BaseEvent):void {
            //子类重写
        }
    }
}
