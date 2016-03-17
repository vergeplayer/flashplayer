package com.youku.proxys {
    
    import com.youku.PlayerConfig;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.interfaces.IPlayerProxy;
    
    import flash.events.EventDispatcher;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class PlayerProxy extends EventDispatcher implements IPlayerProxy {
        public static const ED:String = "ED";
        
        private var _events:Vector.<String>;
        
        
        public function PlayerProxy() {
            super();
            
            init();
        }
        
        private function init():void {
            _events = new Vector.<String>();
            
            _events.push(PlayerProxyEvent.PLAYER_INITIALIZATION_COMPLETE);
            
            _events.push(PlayerProxyEvent.LayerControler_STAGE_RESIZE);
            
            _events.push(PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE);
            
            _events.push(PlayerProxyEvent.GOING);
            
            _events.push(PlayerProxyEvent.CORE_SEEK_NOTIFY);
            _events.push(PlayerProxyEvent.CORE_SEEK_COMPLETE);
            _events.push(PlayerProxyEvent.PLAY);
            _events.push(PlayerProxyEvent.PAUSE);
            _events.push(PlayerProxyEvent.RESUME);
            _events.push(PlayerProxyEvent.SEEK);
            _events.push(PlayerProxyEvent.CHANGE_VOLUME);
            
            _events.push(PlayerProxyEvent.CORE_PLAY_START);
            _events.push(PlayerProxyEvent.CORE_PLAY_STOP);
            _events.push(PlayerProxyEvent.CORE_BUFFER_FULL);
            _events.push(PlayerProxyEvent.CORE_BUFFER_EMPTY);
            _events.push(PlayerProxyEvent.CORE_STREAM_NOT_FOUND);
        }
        
        public function addEventListeners():void {
            for (var i:int = 0; i < _events.length; i++) {
                this.addEventListener(_events[i], thisHandler);
                
            }
        }
        
        public function removeEventListeners():void {
            for (var i:int = 0; i < _events.length; i++) {
                this.removeEventListener(_events[i], thisHandler);
                
            }
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
                    
                    PlayerConfig.prewVolume = PlayerConfig.volume;
                    PlayerConfig.volume = data.volume;
                    break;
                }
                case PlayerProxyEvent.CORE_PLAY_START:  {
                    break;
                }
                case PlayerProxyEvent.CORE_PLAY_STOP:  {
                    break;
                }
                case PlayerProxyEvent.CORE_BUFFER_FULL:  {
                    break;
                }
                case PlayerProxyEvent.CORE_BUFFER_EMPTY:  {
                    break;
                }
                case PlayerProxyEvent.CORE_STREAM_NOT_FOUND:  {
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
