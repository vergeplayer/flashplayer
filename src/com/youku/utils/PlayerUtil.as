package com.youku.utils {
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    
    public class PlayerUtil {
        public function PlayerUtil() {
        }
        
        public static function scale9Grid(displayObject:DisplayObject):void {
            var xx:Number = displayObject.width / 2 - 1;
            var yy:Number = displayObject.height / 2 - 1;
            var ww:Number = displayObject.width / 2 - xx + 1;
            var hh:Number = displayObject.height / 2 - yy + 1;
            displayObject.scale9Grid = new Rectangle(xx, yy, ww, hh);
        }
    }
}
