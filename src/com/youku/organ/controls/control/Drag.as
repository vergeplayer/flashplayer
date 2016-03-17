package com.youku.organ.controls.control {
    import com.youku.PlayerConfig;
    
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    
    public class Drag {
        
        private var m1:MovieClip;
        private var m2:MovieClip;
        private var m3:MovieClip;
        
        private var callbackFunction:Function;
        
        public function Drag(m1:MovieClip, m2:MovieClip, m3:MovieClip, callbackFunction:Function):void {
            this.m1 = m1;
            this.m2 = m2;
            this.m3 = m3;
            this.callbackFunction = callbackFunction;
            
            m2.mouseChildren = m2.mouseEnabled = false;
            
            m1.addEventListener(MouseEvent.MOUSE_UP, m1MouseUpHandler);
            m3.addEventListener(MouseEvent.MOUSE_DOWN, m3MouseDownHandler);
        }
        
        private var _mouseDownX:Number = 0;
        
        private function m3MouseDownHandler(e:MouseEvent):void {
            PlayerConfig.stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
            PlayerConfig.stage.addEventListener(MouseEvent.MOUSE_MOVE, stageMouseMoveHandler);
            
            _mouseDownX = m3.mouseX;
        }
        
        private function stageMouseUpHandler(e:MouseEvent):void {
            PlayerConfig.stage.removeEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
            PlayerConfig.stage.removeEventListener(MouseEvent.MOUSE_MOVE, stageMouseMoveHandler);
            
            _mouseDownX = 0;
        
        }
        
        private function m1MouseUpHandler(e:MouseEvent):void {
            callback(m1.mouseX / (m1.width / m1.scaleX));
        }
        
        private function stageMouseMoveHandler(e:MouseEvent):void {
            callback((m3.parent.mouseX - _mouseDownX - m1.x) / (m1.width - m3.width));
        }
        
        private function callback(value:Number = 0):void {
            //changeState(value);
            
            if (value < 0) {
                value = 0;
            } else if (value > 1) {
                value = 1;
            }
            if (callbackFunction != null) {
                callbackFunction(value);
            }
        }
        
        public function changeState(value:Number = 0):void {
            m3.x = m1.x + value * (m1.width - m3.width);
            
            if (m3.x < m1.x) {
                changeState(0);
                return;
            } else if (m3.x > m1.x + m1.width - m3.width) {
                changeState(1);
                return;
            }
            
            m2.width = m3.x + m3.width * 0.5 - m1.x;
        }
    }
}
