package com.youku.base {
    import flash.display.Sprite;
    
    public class BaseSprite extends Sprite {
        
        protected var _self:Sprite;
        protected var _ID:Number;
        protected var _width:Number;
        protected var _height:Number;
        
        public function BaseSprite() {
            super();
            _self = this;
        }
        
        public function setSize(width:Number, height:Number):void {
            _height = height;
            _width = width;
        }
        
        protected function layout():void {
        
        }
        
        public function get ID():Number {
            return _ID;
        }
        
        public function set ID(value:Number):void {
            _ID = value;
        }
    
    
    
    }
}
