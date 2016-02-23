package com.youku.core.event {
    import com.youku.events.BaseEvent;
    
    public class ConnectionEvent extends BaseEvent {
        public static const CONNECTION_CONNECT_SUCCESS:String = "ConnectionEvent.CONNECTION_CONNECT_SUCCESS";
        
        public function ConnectionEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
