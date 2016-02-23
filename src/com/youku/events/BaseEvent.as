package com.youku.events {
    import flash.events.Event;
    
    public class BaseEvent extends Event {
        private var _data:Object;
        
        public function BaseEvent(type:String, data:Object = null) {
            super(type);
            _data = data;
        }
        
        public function get data():Object {
            return _data;
        }
    }
}
