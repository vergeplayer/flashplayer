package com.youku.core.event {
    import com.youku.events.BaseEvent;
    
    public class CoreEvent extends BaseEvent {
        public static const STREAM_PLAY_START:String = "CoreEvent.STREAM_PLAY_START";
        
        public function CoreEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
