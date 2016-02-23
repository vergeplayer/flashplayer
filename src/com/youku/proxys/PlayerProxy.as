package com.youku.proxys {
    
    import com.youku.PlayerConfig;
    import com.youku.events.PlayerProxyEvent;
    
    import flash.events.EventDispatcher;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class PlayerProxy extends EventDispatcher {
        public static const ED:String = "ED";
        
        public function PlayerProxy() {
            super();
            this.addEventListener(PlayerProxyEvent.PLAY, thisHandler);
            this.addEventListener(PlayerProxyEvent.PAUSE, thisHandler);
            this.addEventListener(PlayerProxyEvent.RESUME, thisHandler);
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
                case PlayerProxyEvent.RESUME:  {
                    
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
