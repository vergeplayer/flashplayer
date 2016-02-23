package com.youku.datas {
    
    
    public class FlashVars {
        private var _src:String = "";
        private var _autoplay:Boolean = false;
        private var _loop:Boolean = false;
        private var _volume:String = "0"
        
        public function FlashVars() {
        }
        
        public function initData(data:Object):void {
            if (data.hasOwnProperty("src")) {
                this.src = data.src;
            }
            if (data.hasOwnProperty("autoplay") && data.autoplay.toString() == "true") {
                this.autoplay = data.autoplay;
            }
            if (data.hasOwnProperty("loop") && data.loop.toString() == "true") {
                this.loop = data.loop;
            }
            if (data.hasOwnProperty("volume")) {
                this.volume = data.volume;
            }
        }
        
        public function get src():String {
            return _src;
        }
        
        public function set src(value:String):void {
            _src = value;
        }
        
        public function get autoplay():Boolean {
            return _autoplay;
        }
        
        public function set autoplay(value:Boolean):void {
            _autoplay = value;
        }
        
        public function get loop():Boolean {
            return _loop;
        }
        
        public function set loop(value:Boolean):void {
            _loop = value;
        }
        
        public function get volume():String {
            return _volume;
        }
        
        public function set volume(value:String):void {
            _volume = value;
        }
    
    
    }
}
