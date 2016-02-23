package com.youku.events {
    
    public class RootViewEvent extends BaseEvent {
        public static const STAGE_RESIZE:String = "RootViewEvent.STAGE_RESIZE";
      
        
        
        public function RootViewEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
