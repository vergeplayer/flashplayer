package com.youku {
    import com.youku.datas.FlashVars;
    import com.youku.datas.MetaData;
    
    import flash.display.Stage;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class PlayerConfig {
        public static var stage:Stage;
        
        public static var stageWidth:Number = 0;
        public static var stageHeight:Number = 0;
        public static const videoWidth:Number = 640;
        public static const videoHeight:Number = 360;
        
        public static var fullScreen:Boolean = false;
        
        public static var volume:Number = 1;
        public static var prewVolume:Number = volume;
        public static var baseURL:String = "";
        
        public static const flashVars:FlashVars = new FlashVars();
        public static const metaData:MetaData = new MetaData();
    
    
    
    
    }
}
