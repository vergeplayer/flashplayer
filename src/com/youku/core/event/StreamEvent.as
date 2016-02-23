package com.youku.core.event {
    import com.youku.events.BaseEvent;
    
    public class StreamEvent extends BaseEvent {
        public static const STREAM_PLAY_START:String = "StreamEvent.STREAM_PLAY_START";
        
        public function StreamEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
