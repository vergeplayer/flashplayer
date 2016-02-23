package com.youku.core.view {
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
        
        private function init():void {
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
        
        override public function setSize(width:Number, height:Number):void {
            super.setSize(width, height);
            
            this._video.width = _width;
            this._video.height = _height;
            
            /*if (this._video.width > PlayerConfig.stageWidth) {
            this._video.width = PlayerConfig.stageWidth;
            this._video.height = this._video.width * _height / _width;
            }*/
            if (this._video.height != PlayerConfig.stageHeight) {
                this._video.height = PlayerConfig.stageHeight;
                this._video.width = this._video.height * _width / _height;
            }
            
            layout();
        }
        
        override protected function layout():void {
            _video.x = PlayerConfig.stageWidth / 2 - _video.width / 2;
            _video.y = PlayerConfig.stageHeight / 2 - _video.height / 2;
        }
    }
}
