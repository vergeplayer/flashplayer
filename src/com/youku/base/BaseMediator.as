package com.youku.base {
    import com.youku.events.PlayerProxyEvent;
    import com.youku.proxys.PlayerProxy;
    
    import flash.display.Sprite;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class BaseMediator {
        protected var _mainSprite:Sprite;
        protected var _playerProxy:PlayerProxy;
        
        public function BaseMediator(mainSprite:Sprite, playerProxy:PlayerProxy) {
            this._mainSprite = mainSprite;
            this._playerProxy = playerProxy;
            
            initAddEventListener();
        }
        
        protected function initAddEventListener():void {
        }
        
        protected function stageSizeChange(e:PlayerProxyEvent):void {
        }
    
    }
}
