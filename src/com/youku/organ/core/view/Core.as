package com.youku.organ.core.view {
    import com.youku.organ.core.event.CoreEvent;
    import com.youku.organ.core.event.StreamEvent;
    import com.youku.organ.core.model.Connection;
    import com.youku.organ.core.model.Stream;
    
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
            _stream.addEventListener(StreamEvent.SEEK_NOTIFY, netStreamHandler);
            _stream.addEventListener(StreamEvent.SEEK_COMPLETE, netStreamHandler);
            _stream.addEventListener(StreamEvent.PLAY_START, netStreamHandler);
            _stream.addEventListener(StreamEvent.PLAY_STOP, netStreamHandler);
            _stream.addEventListener(StreamEvent.BUFFER_FULL, netStreamHandler);
            _stream.addEventListener(StreamEvent.BUFFER_EMPTY, netStreamHandler);
            _stream.addEventListener(StreamEvent.STREAM_NOT_FOUND, netStreamHandler);
            
            _baseVideo = new BaseVideo();
            _baseVideo.attachNetStream(_stream.netStream);
            this.addChild(_baseVideo);
        }
        
        protected function netStreamHandler(e:StreamEvent):void {
            switch (e.type) {
                case StreamEvent.SEEK_NOTIFY:  {
                    this.dispatchEvent(new CoreEvent(CoreEvent.SEEK_NOTIFY, e.data));
                    break;
                }
                case StreamEvent.SEEK_COMPLETE:  {
                    this.dispatchEvent(new CoreEvent(CoreEvent.SEEK_COMPLETE, e.data));
                    break;
                }
                case StreamEvent.PLAY_START:  {
                    this.dispatchEvent(new CoreEvent(CoreEvent.PLAY_START, e.data));
                    break;
                }
                case StreamEvent.PLAY_STOP:  {
                    this.dispatchEvent(new CoreEvent(CoreEvent.PLAY_STOP, e.data));
                    break;
                }
                case StreamEvent.BUFFER_FULL:  {
                    this.dispatchEvent(new CoreEvent(CoreEvent.BUFFER_FULL, e.data));
                    break;
                }
                case StreamEvent.BUFFER_EMPTY:  {
                    this.dispatchEvent(new CoreEvent(CoreEvent.BUFFER_EMPTY, e.data));
                    break;
                }
                case StreamEvent.STREAM_NOT_FOUND:  {
                    this.dispatchEvent(new CoreEvent(CoreEvent.STREAM_NOT_FOUND, e.data));
                    break;
                }
                default:  {
                    break;
                }
            }
        
        
        }
        
        public function closeStream():void {
            _stream.closeStream();
            _baseVideo.clear();
        }
        
        public function play(value:Object = null):void {
            _stream.play(value);
        }
        
        public function pause(value:Object = null):void {
            _stream.pause(value);
        }
        
        public function resume(value:Object = null):void {
            _stream.resume(value);
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
        
        public function setVideoSize(width:Number, height:Number):void {
            _baseVideo.setSize({width: width, height: height});
        }
    }
}
