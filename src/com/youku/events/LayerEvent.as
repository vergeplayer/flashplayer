package com.youku.events {
    import com.youku.base.BaseEvent;
    
    public class LayerEvent extends BaseEvent {
        public static const STAGE_RESIZE:String = "RootViewEvent.STAGE_RESIZE";
      
        
        
        public function LayerEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
