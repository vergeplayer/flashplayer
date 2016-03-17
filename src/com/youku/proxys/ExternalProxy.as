package com.youku.proxys {
    import com.youku.PlayerConfig;
    import com.youku.events.PlayerProxyEvent;
    
    import flash.events.EventDispatcher;
    import flash.external.ExternalInterface;
    
    public class ExternalProxy extends EventDispatcher {
        
        private var _playerProxy:PlayerProxy;
        
        public function ExternalProxy(playerProxy:PlayerProxy) {
            this._playerProxy = playerProxy;
            
            _playerProxy.addEventListener(PlayerProxyEvent.PLAYER_INITIALIZATION_COMPLETE + PlayerProxy.ED, playerProxyHandler);
            
            _playerProxy.addEventListener(PlayerProxyEvent.CORE_SEEK_NOTIFY + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CORE_SEEK_COMPLETE + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CORE_PLAY_START + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CORE_PLAY_STOP + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CORE_BUFFER_FULL + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CORE_BUFFER_EMPTY + PlayerProxy.ED, playerProxyHandler);
            _playerProxy.addEventListener(PlayerProxyEvent.CORE_STREAM_NOT_FOUND + PlayerProxy.ED, playerProxyHandler);
            
            addCallbacks();
        }
        
        protected function playerProxyHandler(e:PlayerProxyEvent):void {
            var value:Object = e.data;
            switch (e.type) {
                case PlayerProxyEvent.PLAYER_INITIALIZATION_COMPLETE + PlayerProxy.ED:  {
                    call("playerInitializationComplete", value);
                    break;
                }
                case PlayerProxyEvent.CORE_SEEK_NOTIFY + PlayerProxy.ED:  {
                    call("onSeeking", value);
                    break;
                }
                case PlayerProxyEvent.CORE_SEEK_COMPLETE + PlayerProxy.ED:  {
                    call("onSeeked", value);
                    break;
                }
                case PlayerProxyEvent.CORE_PLAY_START + PlayerProxy.ED:  {
                    call("onPlaying", value);
                    break;
                }
                case PlayerProxyEvent.CORE_PLAY_STOP + PlayerProxy.ED:  {
                    call("onEnded", value);
                    break;
                }
                case PlayerProxyEvent.CORE_BUFFER_FULL + PlayerProxy.ED:  {
                    call("onCanPlay", value);
                    break;
                }
                case PlayerProxyEvent.CORE_BUFFER_EMPTY + PlayerProxy.ED:  {
                    call("onEmptied", value);
                    break;
                }
                case PlayerProxyEvent.CORE_STREAM_NOT_FOUND + PlayerProxy.ED:  {
                    call("onError", value);
                    break;
                }
                
                case PlayerProxyEvent.CHANGE_VOLUME + PlayerProxy.ED:  {
                    call("onVolumeChange", value);
                    break;
                }
                case PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE + PlayerProxy.ED:  {
                    call("onFullscreenChange", value);
                    break;
                }
                
                case PlayerProxyEvent.PLAY + PlayerProxy.ED:  {
                    call("onPlay", value);
                    break;
                }
                case PlayerProxyEvent.PAUSE + PlayerProxy.ED:  {
                    call("onPause", value);
                    break;
                }
                case PlayerProxyEvent.RESUME + PlayerProxy.ED:  {
                    call("onResume", value);
                    break;
                }
                default:  {
                    break;
                }
            }
        }
        
        private function addCallbacks():void {
            addCallback("play", play);
            addCallback("pause", pause);
            addCallback("resume", resume);
            addCallback("seek", seek);
            addCallback("loop", loop);
            addCallback("muted", muted);
            addCallback("volume", volume);
            addCallback("src", src);
        }
        
        public function play(value:Object = null):void { //开始播放音频/视频
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.PLAY, {src: value}));
        }
        
        public function pause(value:Object = null):void { //暂停当前播放的音频/视频 
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.PAUSE, {}));
        }
        
        public function resume(value:Object = null):void {
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.RESUME, {}));
        }
        
        public function seek(value:Object = null):void {
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.SEEK, {time: value}));
        }
        
        public function loop(value:Boolean = false):void { //设置或返回音频/视频是否应在结束时重新播放 
            PlayerConfig.flashVars.loop = value;
        }
        
        public function muted(value:Boolean = false):void { //设置或返回音频/视频是否静音 
            volume(0);
        }
        
        public function volume(value:Number):void { //设置或返回音频/视频的音量 
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CHANGE_VOLUME, {volume: value}));
        }
        
        public function src(value:String):void { //设置或返回音频/视频元素的当前来源
            PlayerConfig.flashVars.src = value;
            play(value);
        }
        
        
        
        
        
        
        private function call(functionName:String, value:Object = null):void {
            if (ExternalInterface.available) {
                var fns:String = functionName;
                var cs:String = PlayerConfig.flashVars.callbackstringhead;
                if (cs) {
                    fns = cs + "." + fns;
                }
                ExternalInterface.call(fns, value);
            }
        }
        
        private function addCallback(functionName:String, closure:Function):void {
            if (ExternalInterface.available) {
                ExternalInterface.addCallback(functionName, closure);
            }
        }
        
        public function getSize():Object {
            var data:Object = {};
            data.width = PlayerConfig.stageWidth;
            data.height = PlayerConfig.stageHeight;
            data.videoWidth = PlayerConfig.videoWidth;
            data.videoHeight = PlayerConfig.videoHeight;
            return data;
        }
    }
}
