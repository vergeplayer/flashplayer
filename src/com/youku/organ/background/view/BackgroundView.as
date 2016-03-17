package com.youku.organ.background.view {
    import com.youku.PlayerConfig;
    import com.youku.base.BaseSprite;
    
    import flash.display.Shape;
    
    public class BackgroundView extends BaseSprite {
        private var _view:Shape;
        
        public function BackgroundView() {
            init();
        }
        
        public function init(value:Object = null):void {
            _view = new Shape();
            this.addChild(_view);
        }
        
        
        override public function setSize(value:Object):void {
            super.setSize(value)
            _view.graphics.clear();
            _view.graphics.beginFill(0, 1);
            _view.graphics.drawRect(0, 0, value.sw, value.sh);
            _view.graphics.endFill();
            
            layout();
        }
        
        override protected function layout():void {
            _view.x = PlayerConfig.stageWidth * 0.5 - _view.width * 0.5;
            _view.y = PlayerConfig.stageHeight * 0.5 - _view.height * 0.5;
        
        }
    
    }
}
