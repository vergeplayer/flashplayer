package com.youku.proxys {
    import com.youku.PlayerConfig;
    
    import flash.events.EventDispatcher;
    import flash.external.ExternalInterface;
    
    public class ExternalProxy extends EventDispatcher {
        public function ExternalProxy() {
        
        }
        
        public function addCallbacks():void {
            if (ExternalInterface.available) {
                //ExternalInterface.addCallback("abort", null);
            }
        }
        
        public function abort(value:Object = null):void { //当音频/视频的加载已放弃时
            call("abort", value);
        }
        
        public function canplay(value:Object = null):void { //当浏览器可以播放音频/视频时
            call("canplay", value);
        }
        
        public function canplaythrough(value:Object = null):void { //当浏览器可在不因缓冲而停顿的情况下进行播放时
            call("canplaythrough", value);
        }
        
        public function durationchange(value:Object = null):void { //当音频/视频的时长已更改时
            call("durationchange", value);
        }
        
        public function emptied(value:Object = null):void { //当目前的播放列表为空时
            call("emptied", value);
        }
        
        public function ended(value:Object = null):void { //当目前的播放列表已结束时
            call("ended", value);
        }
        
        public function error(value:Object = null):void { //当在音频/视频加载期间发生错误时
            call("error", value);
        }
        
        public function loadeddata(value:Object = null):void { //当浏览器已加载音频/视频的当前帧时
            call("loadeddata", value);
        }
        
        public function loadedmetadata(value:Object = null):void { //当浏览器已加载音频/视频的元数据时
            call("loadedmetadata", value);
        }
        
        public function loadstart(value:Object = null):void { //当浏览器开始查找音频/视频时
            call("loadstart", value);
        }
        
        public function pause(value:Object = null):void { //当音频/视频已暂停时
            call("pause", value);
        }
        
        public function play(value:Object = null):void { //当音频/视频已开始或不再暂停时
            call("play", value);
        }
        
        public function playing(value:Object = null):void { //当音频/视频在已因缓冲而暂停或停止后已就绪时
            call("playing", value);
        }
        
        public function progress(value:Object = null):void { //当浏览器正在下载音频/视频时
            call("progress", value);
        }
        
        public function ratechange(value:Object = null):void { //当音频/视频的播放速度已更改时
            call("ratechange", value);
        }
        
        public function seeked(value:Object = null):void { //当用户已移动/跳跃到音频/视频中的新位置时
            call("seeked", value);
        }
        
        public function seeking(value:Object = null):void { //当用户开始移动/跳跃到音频/视频中的新位置时
            call("seeking", value);
        }
        
        public function stalled(value:Object = null):void { //当浏览器尝试获取媒体数据，但数据不可用时
            call("stalled", value);
        }
        
        public function suspend(value:Object = null):void { //当浏览器刻意不获取媒体数据时
            call("suspend", value);
        }
        
        public function timeupdate(value:Object = null):void { //当目前的播放位置已更改时
            call("timeupdate", value);
        }
        
        public function volumechange(value:Object = null):void { //当音量已更改时
            call("volumechange", value);
        }
        
        public function waiting(value:Object = null):void { //当视频由于需要缓冲下一帧而停止
            call("waiting", value);
        }
        
        private function call(functionName:String, value:Object = null):void {
            if (ExternalInterface.available) {
                ExternalInterface.call(functionName, value);
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
