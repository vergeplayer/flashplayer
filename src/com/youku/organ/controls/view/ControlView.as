package com.youku.organ.controls.view {
    import com.youku.PlayerConfig;
    import com.youku.base.BaseSprite;
    import com.youku.organ.controls.control.Drag;
    import com.youku.organ.controls.event.ControlEvent;
    import com.youku.utils.PlayerUtil;
    
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    
    public class ControlView extends BaseSprite {
        private var _view:MovieClip;
        
        private var _bg:MovieClip;
        private var _pauseResumeMovieClip:MovieClip;
        private var _progressBarMovieClip:MovieClip;
        private var _progressTextField:TextField;
        private var _volumeBarMovieClip:MovieClip;
        private var _fullScreenMovieClip:MovieClip;
        
        private var _progressBarMovieClipDrag:Drag;
        private var _volumeBarMovieClipDrag:Drag;
        
        private var _muteMovieClip:MovieClip;
        
        public function ControlView() {
            init();
        }
        
        public function init(value:Object = null):void {
            _view = new 视频控制条();
            this.addChild(_view);
            
            _bg = _view.getChildByName("BG_MOVIE_CLIP") as MovieClip;
            PlayerUtil.scale9Grid(_bg);
            _bg.width = PlayerConfig.stageWidth * 0.9;
            
            _pauseResumeMovieClip = _view.getChildByName("PAUSE_RESUME_MOVIE_CLIP") as MovieClip;
            _pauseResumeMovieClip.buttonMode = true;
            _pauseResumeMovieClip.addEventListener(MouseEvent.CLICK, pauseOrResumeClick);
            
            _progressBarMovieClip = _view.getChildByName("PROGRESS_BAR_MOVIE_CLIP") as MovieClip;
            var _progressBarMovieClipBg1:MovieClip = _progressBarMovieClip.getChildByName("BG1_MOVIE_CLIP") as MovieClip;
            _progressBarMovieClipBg1.width = _bg.width * 0.5;
            var _progressBarMovieClipBg2:MovieClip = _progressBarMovieClip.getChildByName("BG2_MOVIE_CLIP") as MovieClip;
            var _progressBarMovieClipBg3:MovieClip = _progressBarMovieClip.getChildByName("SEEK_BAR_HANDLE_MOVIE_CLIP") as MovieClip;
            _progressBarMovieClipDrag = new Drag(_progressBarMovieClipBg1, _progressBarMovieClipBg2, _progressBarMovieClipBg3, progressBarMovieClipBgHandler);
            
            _progressTextField = _view.getChildByName("PROGRESS_TEXT_FIELD") as TextField;
            
            _volumeBarMovieClip = _view.getChildByName("VOLUME_BAR_MOVIE_CLIP") as MovieClip;
            _muteMovieClip = _volumeBarMovieClip.getChildByName("MUTE_MOVIE_CLIP") as MovieClip;
            _muteMovieClip.stop();
            _muteMovieClip.buttonMode = true;
            _muteMovieClip.addEventListener(MouseEvent.CLICK, function():void {
                if (PlayerConfig.volume != 0) {
                    volumeBarMovieClipBgHandler(0);
                } else {
                    volumeBarMovieClipBgHandler(PlayerConfig.prewVolume);
                };
            });
            var _volumeBarMovieClipBg1:MovieClip = _volumeBarMovieClip.getChildByName("BG1_MOVIE_CLIP") as MovieClip;
            var _volumeBarMovieClipBg2:MovieClip = _volumeBarMovieClip.getChildByName("BG2_MOVIE_CLIP") as MovieClip;
            var _volumeBarMovieClipBg3:MovieClip = _volumeBarMovieClip.getChildByName("VOLUME_BAR_HANDLE_MOVIE_CLIP") as MovieClip;
            _volumeBarMovieClipDrag = new Drag(_volumeBarMovieClipBg1, _volumeBarMovieClipBg2, _volumeBarMovieClipBg3, volumeBarMovieClipBgHandler);
            
            _fullScreenMovieClip = _view.getChildByName("FULL_SCREEN_MOVIE_CLIP") as MovieClip;
            _fullScreenMovieClip.buttonMode = true;
            _fullScreenMovieClip.addEventListener(MouseEvent.CLICK, fullScreenMovieClipClick);
            
            var bgw:Number = _bg.width;
            var cw:Number = _pauseResumeMovieClip.width + _progressBarMovieClip.width + _progressTextField.textWidth + _volumeBarMovieClip.width + _fullScreenMovieClip.width;
            var marginWidth:Number = 20;
            var dw:Number = (bgw - marginWidth * 2 - cw) / (5 - 1);
            
            _pauseResumeMovieClip.x = marginWidth;
            _progressBarMovieClip.x = _pauseResumeMovieClip.x + _pauseResumeMovieClip.width + dw;
            _progressTextField.x = _progressBarMovieClip.x + _progressBarMovieClip.width + dw;
            _volumeBarMovieClip.x = _progressTextField.x + _progressTextField.textWidth + dw;
            _fullScreenMovieClip.x = _volumeBarMovieClip.x + _volumeBarMovieClip.width + dw;
        }
        
        
        
        public function changeProgressBarMovieClipState(value:Number):void {
            _progressBarMovieClipDrag.changeState(value);
        }
        
        protected function progressBarMovieClipBgHandler(e:*):void {
            this.dispatchEvent(new ControlEvent(ControlEvent.SEEK, {time: uint(e * PlayerConfig.metaData.duration)}));
        }
        
        
        
        public function changeVolumeBarMovieClipState(value:Number):void {
            if (value == 0) {
                _muteMovieClip.gotoAndStop(2);
            } else {
                _muteMovieClip.gotoAndStop(1);
            }
            _volumeBarMovieClipDrag.changeState(value);
        }
        
        protected function volumeBarMovieClipBgHandler(e:*):void {
            var volume:Number = e;
            this.dispatchEvent(new ControlEvent(ControlEvent.VOLUME_CHANGE, {volume: volume}));
        }
        
        public function changeProgressTextFieldState(value:String):void {
            _progressTextField.text = value;
        }
        
        public function changePauseResumeMovieClipState(value:String):void {
            _pauseResumeMovieClip.gotoAndPlay(value);
        }
        
        protected function pauseOrResumeClick(e:MouseEvent):void {
            if (_pauseResumeMovieClip.currentLabel == "pause") {
                this.dispatchEvent(new ControlEvent(ControlEvent.RESUME));
                
            } else if (_pauseResumeMovieClip.currentLabel == "resume") {
                this.dispatchEvent(new ControlEvent(ControlEvent.PAUSE));
                
            }
        }
        
        
        
        protected function fullScreenMovieClipClick(e:MouseEvent):void {
            this.dispatchEvent(new ControlEvent(ControlEvent.CHANGE_FULL_SCREEN));
        }
        
        override public function setSize(value:Object):void {
            super.setSize(value)
            
            layout();
        }
        
        override protected function layout():void {
            
            _view.x = PlayerConfig.stageWidth * 0.5 - _view.width * 0.5;
            _view.y = PlayerConfig.stageHeight - _view.height - 5;
        
        }
    
    }
}
