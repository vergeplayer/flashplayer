package com.youku.organ.controls.event {
    import com.youku.base.BaseEvent;
    
    
    public class ControlEvent extends BaseEvent {
        public static const INIT_MODULE_LENGTH:String = "ControlEvent.INIT_MODULE_LENGTH";
        
        public static const SHOW_HELP_INFORMATION:String = "ControlEvent.SHOW_HELP_INFORMATION"; //展示帮助界面
        public static const HIDE_HELP_INFORMATION:String = "ControlEvent.HIDE_HELP_INFORMATION"; //隐藏帮助界面
        
        public static const SHOW_LITERATURE:String = "ControlEvent.SHOW_LITERATURE"; //展示文献界面
        public static const HIDE_LITERATURE:String = "ControlEvent.HIDE_LITERATURE"; //隐藏文献界面
        
        public static const SHOW_CHECK:String = "ControlEvent.SHOW_CHECK"; //展示检查界面
        public static const HIDE_CHECK:String = "ControlEvent.HIDE_CHECK"; //隐藏检查界面
        
        public static const VOLUME_CHANGE:String = "ControlEvent.VOLUME_CHANGE";
        public static const CHANGE_FULL_SCREEN:String = "ControlEvent.CHANGE_FULL_SCREEN";
        
        public static const LOAD_PLUGIN:String = "ControlEvent.LOAD_PLUGIN";
        public static const CHANGE_CURRENT_ID:String = "ControlEvent.CHANGE_CURRENT_ID";
        
        public static const EXIT:String = "ControlEvent.EXIT";
        
        public static const REPLAY:String = "ControlEvent.REPLAY";
        public static const PAUSE:String = "ControlEvent.PAUSE";
        public static const RESUME:String = "ControlEvent.RESUME";
        public static const SEEK:String = "ControlEvent.SEEK";
        
        public function ControlEvent(type:String, data:Object = null) {
            super(type, data);
        }
    
    }
}
