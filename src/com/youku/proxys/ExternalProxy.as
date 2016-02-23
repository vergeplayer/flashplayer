package com.youku.proxys {
    import com.youku.PlayerConfig;
    import com.youku.events.PlayerProxyEvent;
    
    import flash.events.EventDispatcher;
    import flash.external.ExternalInterface;
    
    public class ExternalProxy extends EventDispatcher {
        
        private var _playerProxy:PlayerProxy;
        
        public function ExternalProxy(playerProxy:PlayerProxy) {
            this._playerProxy = playerProxy;
        
        }
        
        public function addCallbacks():void {
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
        
        
        
        
        
        
        
        
        
        public function callAbort(value:Object = null):void { //当音频/视频的加载已放弃时
            call("abort", value);
        }
        
        public function callCanplay(value:Object = null):void { //当浏览器可以播放音频/视频时
            call("canplay", value);
        }
        
        public function callcanplaythrough(value:Object = null):void { //当浏览器可在不因缓冲而停顿的情况下进行播放时
            call("canplaythrough", value);
        }
        
        public function callDurationchange(value:Object = null):void { //当音频/视频的时长已更改时
            call("durationchange", value);
        }
        
        public function callEmptied(value:Object = null):void { //当目前的播放列表为空时
            call("emptied", value);
        }
        
        public function callEnded(value:Object = null):void { //当目前的播放列表已结束时
            call("ended", value);
        }
        
        public function callError(value:Object = null):void { //当在音频/视频加载期间发生错误时
            call("error", value);
        }
        
        public function callLoadeddata(value:Object = null):void { //当浏览器已加载音频/视频的当前帧时
            call("loadeddata", value);
        }
        
        public function callLoadedmetadata(value:Object = null):void { //当浏览器已加载音频/视频的元数据时
            call("loadedmetadata", value);
        }
        
        public function callLoadstart(value:Object = null):void { //当浏览器开始查找音频/视频时
            call("loadstart", value);
        }
        
        public function callpause(value:Object = null):void { //当音频/视频已暂停时
            call("pause", value);
        }
        
        public function callPlay(value:Object = null):void { //当音频/视频已开始或不再暂停时
            call("play", value);
        }
        
        public function callPlaying(value:Object = null):void { //当音频/视频在已因缓冲而暂停或停止后已就绪时
            call("playing", value);
        }
        
        public function callProgress(value:Object = null):void { //当浏览器正在下载音频/视频时
            call("progress", value);
        }
        
        public function callRatechange(value:Object = null):void { //当音频/视频的播放速度已更改时
            call("ratechange", value);
        }
        
        public function callSeeked(value:Object = null):void { //当用户已移动/跳跃到音频/视频中的新位置时
            call("seeked", value);
        }
        
        public function callSeeking(value:Object = null):void { //当用户开始移动/跳跃到音频/视频中的新位置时
            call("seeking", value);
        }
        
        public function callStalled(value:Object = null):void { //当浏览器尝试获取媒体数据，但数据不可用时
            call("stalled", value);
        }
        
        public function callSuspend(value:Object = null):void { //当浏览器刻意不获取媒体数据时
            call("suspend", value);
        }
        
        public function callTimeupdate(value:Object = null):void { //当目前的播放位置已更改时
            call("timeupdate", value);
        }
        
        public function callVolumechange(value:Object = null):void { //当音量已更改时
            call("volumechange", value);
        }
        
        public function callWaiting(value:Object = null):void { //当视频由于需要缓冲下一帧而停止
            call("waiting", value);
        }
        
        private function call(functionName:String, value:Object = null):void {
            if (ExternalInterface.available) {
                ExternalInterface.call(functionName, value);
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
