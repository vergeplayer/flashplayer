package com.youku.datas {
    
    public class MetaData {
        private var _audiosamplerate:Number = 0;
        private var _aacaot:Number = 0;
        private var _duration:Number = 0;
        private var _trackinfo:Object;
        private var _avclevel:Number = 0;
        private var _width:Number = 0;
        private var _height:Number = 0;
        private var _seekpoints:Object;
        private var _avcprofile:Number = 0;
        private var _videoframerate:Number = 0;
        private var _videocodecid:String = "";
        private var _audiocodecid:String = "";
        private var _moovposition:Number = 0;
        private var _audiochannels:Number = 0;
        
        public function MetaData() {
            _audiosamplerate = 0;
            _aacaot = 0;
            _duration = 0;
            _trackinfo = null;
            _avclevel = 0;
            _width = 0;
            _height = 0;
            _seekpoints = null;
            _avcprofile = 0;
            _videoframerate = 0;
            _videocodecid = "";
            _audiocodecid = "";
            _moovposition = 0;
            _audiochannels = 0;
        }
        
        public function initData(value:Object):void {
            if (value.hasOwnProperty("audiosamplerate")) {
                _audiosamplerate = value["audiosamplerate"];
            }
            if (value.hasOwnProperty("aacaot")) {
                _aacaot = value["aacaot"];
            }
            if (value.hasOwnProperty("duration")) {
                _duration = value["duration"];
            }
            if (value.hasOwnProperty("trackinfo")) {
                _trackinfo = value["trackinfo"];
            }
            if (value.hasOwnProperty("avclevel")) {
                _avclevel = value["avclevel"];
            }
            if (value.hasOwnProperty("width")) {
                _width = value["width"];
            }
            if (value.hasOwnProperty("height")) {
                _height = value["height"];
            }
            if (value.hasOwnProperty("seekpoints")) {
                _seekpoints = value["seekpoints"];
            }
            if (value.hasOwnProperty("avcprofile")) {
                _avcprofile = value["avcprofile"];
            }
            if (value.hasOwnProperty("videoframerate")) {
                _videoframerate = value["videoframerate"];
            }
            if (value.hasOwnProperty("videocodecid")) {
                _videocodecid = value["videocodecid"];
            }
            if (value.hasOwnProperty("audiocodecid")) {
                _audiocodecid = value["audiocodecid"];
            }
            if (value.hasOwnProperty("moovposition")) {
                _moovposition = value["moovposition"];
            }
            if (value.hasOwnProperty("audiochannels")) {
                _audiochannels = value["audiochannels"];
            }
        }
        
        public function get audiosamplerate():Number {
            return _audiosamplerate;
        }
        
        public function get aacaot():Number {
            return _aacaot;
        }
        
        public function get duration():Number {
            return _duration;
        }
        
        public function get trackinfo():Object {
            return _trackinfo;
        }
        
        public function get avclevel():Number {
            return _avclevel;
        }
        
        public function get width():Number {
            return _width;
        }
        
        public function get height():Number {
            return _height;
        }
        
        public function get seekpoints():Object {
            return _seekpoints;
        }
        
        public function get avcprofile():Number {
            return _avcprofile;
        }
        
        public function get videoframerate():Number {
            return _videoframerate;
        }
        
        public function get videocodecid():String {
            return _videocodecid;
        }
        
        public function get audiocodecid():String {
            return _audiocodecid;
        }
        
        public function get moovposition():Number {
            return _moovposition;
        }
        
        public function get audiochannels():Number {
            return _audiochannels;
        }
    
    
    }
}
