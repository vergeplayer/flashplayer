package com.youku.organ.layer.view {
    import com.youku.PlayerConfig;
    import com.youku.base.BaseSprite;
    import com.youku.events.LayerEvent;
    
    import flash.display.Sprite;
    import flash.display.StageDisplayState;
    import flash.events.Event;
    
    /**
     *
     * @author PANQIBAO
     *
     */
    public class LayerView extends BaseSprite {
        private var _background:Sprite;
        private var _videoLayer:Sprite;
        private var _videoOverLayer:Sprite;
        private var _pluginLayer:Sprite;
        private var _adLayer:Sprite;
        private var _controlsLayer:Sprite;
        private var _endCardLayer:Sprite;
        
        public function LayerView() {
            init();
        }
        
        private function init():void {
            _background = new Sprite();
            _videoLayer = new Sprite();
            _videoOverLayer = new Sprite();
            _pluginLayer = new Sprite();
            _adLayer = new Sprite();
            _controlsLayer = new Sprite();
            _endCardLayer = new Sprite();
            
            this.addChild(_background);
            this.addChild(_videoLayer);
            this.addChild(_videoOverLayer);
            this.addChild(_pluginLayer);
            this.addChild(_adLayer);
            this.addChild(_endCardLayer);
            this.addChild(_controlsLayer);
            
            this.addEventListener(Event.ADDED_TO_STAGE, thisAddedToStage);
        }
        
        private function thisAddedToStage(e:Event):void {
            this.removeEventListener(Event.ADDED_TO_STAGE, thisAddedToStage);
            
            this.stage.addEventListener(Event.RESIZE, stageResize);
        }
        
        public function stageResize(e:Event = null):void {
            this.dispatchEvent(new LayerEvent(LayerEvent.STAGE_RESIZE, getStageSize));
        }
        
        protected function get getStageSize():Object {
            PlayerConfig.stageWidth = stage.stageWidth;
            PlayerConfig.stageHeight = stage.stageHeight;
            PlayerConfig.fullScreen = (stage.displayState === StageDisplayState.FULL_SCREEN || stage.displayState === StageDisplayState.FULL_SCREEN_INTERACTIVE);
            
            var o:Object = {
                    sw: PlayerConfig.stageWidth,
                    stageWidth: PlayerConfig.stageWidth,
                    sh: PlayerConfig.stageHeight,
                    stageHeight: PlayerConfig.stageHeight,
                    fs: PlayerConfig.fullScreen,
                    fullScreen: PlayerConfig.fullScreen
                };
            return o;
        }
        
        public function changeDisplayState():void {
            try {
                if (stage.displayState === StageDisplayState.NORMAL) {
                    stage.displayState = StageDisplayState.FULL_SCREEN;
                } else if (stage.displayState === StageDisplayState.FULL_SCREEN) {
                    stage.displayState = StageDisplayState.NORMAL;
                } else if (stage.displayState === StageDisplayState.FULL_SCREEN_INTERACTIVE) {
                    stage.displayState = StageDisplayState.NORMAL;
                }
            } catch (erro:Error) {
                trace(erro.getStackTrace());
            } 
        }
        
        override public function setSize(value:Object):void {
            super.setSize(value)
            
            layout();
        }
        
        override protected function layout():void {
        }
        
        
        
        
        public function get background():Sprite {
            return _background;
        }
        
        public function get videoLayer():Sprite {
            return _videoLayer;
        }
        
        public function get videoOverLayer():Sprite {
            return _videoOverLayer;
        }
        
        public function get adLayer():Sprite {
            return _adLayer;
        }
        
        public function get pluginLayer():Sprite {
            return _pluginLayer;
        }
        
        public function get controlsLayer():Sprite {
            return _controlsLayer;
        }
        
        public function get endCardLayer():Sprite {
            return _endCardLayer;
        }
    }
}
