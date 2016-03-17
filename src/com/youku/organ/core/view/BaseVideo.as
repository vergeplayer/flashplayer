package com.youku.organ.core.view {
    import com.youku.PlayerConfig;
    import com.youku.base.BaseSprite;
    
    import flash.media.Video;
    import flash.net.NetStream;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class BaseVideo extends BaseSprite {
        private var _video:Video;
        
        public function BaseVideo():void {
            super();
            
            init();
        }
        
        protected function init():void {
            _video = new Video(PlayerConfig.videoWidth, PlayerConfig.videoHeight);
            _video.smoothing = true;
            this.addChild(_video);
        }
        
        public function attachNetStream(netStream:NetStream):void {
            _video.attachNetStream(netStream);
        }
        
        public function clear():void {
            _video.clear();
        }
        
        override public function setSize(value:Object):void {
            super.setSize(value)
            
            var s:Number = this._video.height / this._video.width;
            
            this._video.width = value.width;
            this._video.height = this._video.width * s;
            
            if (this._video.height > value.height) {
                this._video.height = value.height;
                this._video.width = this._video.height * _width / _height;
            }
            
            layout();
        }
        
        override protected function layout():void {
            _video.x = (PlayerConfig.stageWidth - _video.width) * 0.5;
            _video.y = (PlayerConfig.stageHeight - _video.height) * 0.5;
        }
    }
}
