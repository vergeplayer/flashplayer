package com.youku.core.model {
    import com.youku.PlayerConfig;
    import com.youku.core.event.StreamEvent;
    
    import flash.events.EventDispatcher;
    import flash.events.NetStatusEvent;
    import flash.media.SoundTransform;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    
    public class Stream extends EventDispatcher {
        private var _connection:NetConnection;
        private var _netStream:NetStream;
        private var _data:Object = {};
        
        private var _duration:Number = 0;
        private var _end:Boolean = false;
        
        public function Stream(connection:NetConnection) {
            this._connection = connection;
            
            init();
        }
        
        private function init():void {
            _data.onMetaData = onMetaData;
            _data.onXMPData = onXMPData;
            _netStream = new NetStream(_connection);
            _netStream.client = _data;
            _netStream.addEventListener(NetStatusEvent.NET_STATUS, netStreamNetStatus);
        }
        
        protected function netStreamNetStatus(e:NetStatusEvent):void {
            trace('netStreamNetStatus---', "code:" + e.info.code, "description:" + e.info.description);
            switch (e.info.code) {
                case "NetStream.Play.Start":
                    this.dispatchEvent(new StreamEvent(StreamEvent.STREAM_PLAY_START, null));
                    break;
                case "NetStream.Play.Stop":
                    break;
                case "NetStream.Buffer.Full":
                    break;
                case "NetStream.Buffer.Empty":
                    _end = true;
                    break;
                case "NetStream.Play.StreamNotFound":
                    break;
                case "NetStream.Seek.InvalidTime":
                    break;
                case "NetStream.Play.PublishNotify":
                    break;
                case "NetStream.Play.UnpublishNotify":
                    break;
                case "NetStream.Video.DimensionChange":
                    break;
            }
        }
        
        private function onMetaData(data:Object):void {
            for (var i:Object in data) {
                trace('onMetaData:', i, data[i]);
            }
            if (data.hasOwnProperty("duration")) {
                _duration = data["duration"];
            }
        }
        
        private function onXMPData(data:Object):void {
            for (var i:Object in data) {
                trace('onXMPData:', i, data[i]);
            }
        }
        
        public function play(value:Object = null):void {
            if (PlayerConfig.flashVars.autoplay == false) {
                return;
            }
            netStream.play(value);
        }
        
        public function pause(value:Object = null):void {
            netStream.pause();
        }
        
        public function resume(value:Object = null):void {
            netStream.resume();
        }
        
        public function seek(value:Number):void {
            netStream.seek(value);
        }
        
        public function changeVolume(value:Number):void {
            netStream.soundTransform = new SoundTransform(value);
        }
        
        public function get buffered():Number {
            return netStream.bufferLength;
        }
        
        public function get currentTime():Number {
            return netStream.time;
        }
        
        public function get duration():Number {
            return _duration;
        }
        
        public function closeStream():void {
            netStream.close();
        }
        
        public function get netStream():NetStream {
            return _netStream;
        }
    
    }
}
