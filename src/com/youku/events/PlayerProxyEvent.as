package com.youku.events {
    import com.youku.base.BaseEvent;
    
    
    public class PlayerProxyEvent extends BaseEvent {
        public static const PLAYER_INITIALIZATION_COMPLETE:String = "PlayerProxyEvent.PLAYER_INITIALIZATION_COMPLETE";
        
        public static const LayerControler_STAGE_RESIZE:String = "PlayerProxyEvent.LayerControler_STAGE_RESIZE";
        
        public static const ControlControler_FULL_SCREEN_CHANGE:String = "PlayerProxyEvent.ControlControler_FULL_SCREEN_CHANGE";
        
        public static const GOING:String = "PlayerProxyEvent.GOING";
        
        public static const PLAY:String = "PlayerProxyEvent.PLAY";
        public static const PAUSE:String = "PlayerProxyEvent.PAUSE";
        public static const RESUME:String = "PlayerProxyEvent.RESUME";
        public static const SEEK:String = "PlayerProxyEvent.SEEK";
        public static const CHANGE_VOLUME:String = "PlayerProxyEvent.CHANGE_VOLUME";
        
        
        public static const CORE_SEEK_NOTIFY:String = "PlayerProxyEvent.CORE_SEEK_NOTIFY";
        public static const CORE_SEEK_COMPLETE:String = "PlayerProxyEvent.CORE_SEEK_COMPLETE";
        public static const CORE_PLAY_START:String = "PlayerProxyEvent.CORE_PLAY_START";
        public static const CORE_BUFFER_FULL:String = "PlayerProxyEvent.CORE_BUFFER_FULL";
        public static const CORE_PLAY_STOP:String = "PlayerProxyEvent.CORE_PLAY_STOP";
        public static const CORE_BUFFER_EMPTY:String = "PlayerProxyEvent.CORE_BUFFER_EMPTY";
        public static const CORE_STREAM_NOT_FOUND:String = "PlayerProxyEvent.CORE_STREAM_NOT_FOUND";
        
        public function PlayerProxyEvent(type:String, data:Object = null) {
            super(type, data);
        }
    }
}
