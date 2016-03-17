package com.youku.organ.core.event {
    import com.youku.base.BaseEvent;
    
    public class StreamEvent extends BaseEvent {
        public static const SEEK_NOTIFY:String = "StreamEvent.SEEK_NOTIFY";
        public static const SEEK_COMPLETE:String = "StreamEvent.SEEK_COMPLETE";
        public static const PLAY_START:String = "StreamEvent.PLAY_START";
        public static const BUFFER_FULL:String = "StreamEvent.BUFFER_FULL";
        public static const PLAY_STOP:String = "StreamEvent.PLAY_STOP";
        public static const BUFFER_EMPTY:String = "StreamEvent.BUFFER_EMPTY";
        public static const STREAM_NOT_FOUND:String = "StreamEvent.STREAM_NOT_FOUND";
        
        public function StreamEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
