package com.youku.organ.core.event {
    import com.youku.base.BaseEvent;
    
    public class CoreEvent extends BaseEvent {
        public static const SEEK_NOTIFY:String = "CoreEvent.SEEK_NOTIFY";
        public static const SEEK_COMPLETE:String = "CoreEvent.SEEK_COMPLETE";
        public static const PLAY_START:String = "CoreEvent.PLAY_START";
        public static const BUFFER_FULL:String = "CoreEvent.BUFFER_FULL";
        public static const PLAY_STOP:String = "CoreEvent.PLAY_STOP";
        public static const BUFFER_EMPTY:String = "CoreEvent.BUFFER_EMPTY";
        public static const STREAM_NOT_FOUND:String = "CoreEvent.STREAM_NOT_FOUND";
        
        public function CoreEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
