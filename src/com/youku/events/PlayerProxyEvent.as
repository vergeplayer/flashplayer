package com.youku.events {
    
    public class PlayerProxyEvent extends BaseEvent {
        public static const ROOT_VIEW_MEDIATOR_STAGE_RESIZE:String = "PlayerProxyEvent.ROOT_VIEW_MEDIATOR_STAGE_RESIZE";
        
        public static const PLAY:String = "PlayerProxyEvent.PLAY";
        public static const PAUSE:String = "PlayerProxyEvent.PAUSE";
        public static const RESUME:String = "PlayerProxyEvent.RESUME";
        public static const SEEK:String = "PlayerProxyEvent.SEEK";
        public static const CHANGE_VOLUME:String = "PlayerProxyEvent.CHANGE_VOLUME";
        
        
        
        public function PlayerProxyEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
