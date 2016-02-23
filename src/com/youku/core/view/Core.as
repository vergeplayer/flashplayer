package com.youku.core.view {
    import com.youku.core.event.CoreEvent;
    import com.youku.core.event.StreamEvent;
    import com.youku.core.model.Connection;
    import com.youku.core.model.Stream;
    
    import flash.display.Sprite;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class Core extends Sprite {
        
        private var _stream:Stream;
        private var _connection:Connection;
        private var _baseVideo:BaseVideo;
        
        public function Core() {
            
            init();
        }
        
        protected function init():void {
            _connection = new Connection();
            _stream = new Stream(_connection.netConnection);
            _stream.addEventListener(StreamEvent.STREAM_PLAY_START, netStreamPlayStart);
            
            _baseVideo = new BaseVideo();
            _baseVideo.attachNetStream(_stream.netStream);
            this.addChild(_baseVideo);
        }
        
        protected function netStreamPlayStart(e:StreamEvent):void {
            this.dispatchEvent(new CoreEvent(CoreEvent.STREAM_PLAY_START, e.data));
        }
        
        public function closeStream():void {
            if (_stream) {
                _stream.closeStream();
            }
            if (_baseVideo) {
                _baseVideo.clear();
            }
        }
        
        public function play(value:Object = null):void {
            return _stream.play(value);
        }
        
        public function pause(value:Object = null):void {
            return _stream.pause(value);
        }
        
        public function changeVolume(value:Number):void {
            _stream.changeVolume(value);
        }
        
        public function get buffered():Number {
            return _stream.buffered;
        }
        
        public function seek(value:Number):void {
            _stream.seek(value);
        }
        
        public function get currentTime():Number {
            return _stream.currentTime;
        }
        
        public function get duration():Number {
            return _stream.duration;
        }
        
        public function setVideoSize(width:Number, height:Number):void {
            if (!_baseVideo) {
                return;
            }
            _baseVideo.setSize(width, height);
        }
    }
}
