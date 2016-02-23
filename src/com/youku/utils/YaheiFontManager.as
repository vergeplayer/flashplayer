package com.youku.utils {
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    /**
     * 用于解决chrome浏览器下微软雅黑字体显示异常的问题
     */
    public class YaheiFontManager {
        public static var MICROSOFT_YAHEI:String = "Microsoft YaHei";
        
        public static function setYaheiFont():void {
            var tf1:TextField = new TextField();
            tf1.defaultTextFormat = new TextFormat("Microsoft YaHei", 12, 0xFFFFFF);
            tf1.text = "雅黑";
            
            var tf2:TextField = new TextField();
            tf2.defaultTextFormat = new TextFormat(null, 12, 0xFFFFFF);
            tf2.text = "雅黑";
            
            //微软雅黑和默认字体的textHeight应该是不同的
            if (tf1.textHeight === tf2.textHeight) {
                MICROSOFT_YAHEI = "微软雅黑";
            }
            
            var tf3:TextField = new TextField();
            tf3.defaultTextFormat = new TextFormat("微软雅黑", 12, 0xFFFFFF);
            tf3.text = "雅黑";
            //防止默认就是Microsoft YaHei的情况
            if (tf1.textHeight >= tf3.textHeight) {
                MICROSOFT_YAHEI = "Microsoft YaHei";
            }
        }
    }
}
