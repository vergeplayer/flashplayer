package com.youku.proxys {
    
    import com.youku.PlayerConfig;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.interfaces.IPlayerProxy;
    
    import flash.events.Event;
    import flash.events.EventDispatcher;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class PlayerProxy extends EventDispatcher implements IPlayerProxy {
        public static const ED:String = "ED";
        
        public function PlayerProxy() {
            super();
            this.addEventListener(PlayerProxyEvent.PLAY, thisHandler);
            this.addEventListener(PlayerProxyEvent.PAUSE, thisHandler);
            this.addEventListener(PlayerProxyEvent.LOAD, thisHandler);
            this.addEventListener(PlayerProxyEvent.SEEK, thisHandler);
            this.addEventListener(PlayerProxyEvent.CHANGE_VOLUME, thisHandler);
        }
        
        protected function thisHandler(e:PlayerProxyEvent):void {
            var data:Object = e.data;
            switch (e.type) {
                case PlayerProxyEvent.PLAY:  {
                    
                    break;
                }
                case PlayerProxyEvent.PAUSE:  {
                    
                    break;
                }
                case PlayerProxyEvent.LOAD:  {
                    
                    break;
                }
                case PlayerProxyEvent.SEEK:  {
                    
                    break;
                }
                case PlayerProxyEvent.CHANGE_VOLUME:  {
                    PlayerConfig.flashVars.volume = data.volume;
                    break;
                }
                default:  {
                    break;
                }
            }
            this.dispatchEvent(new PlayerProxyEvent(e.type + PlayerProxy.ED, e.data));
        }
    
    }

}
