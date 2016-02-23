package {
    import com.youku.PlayerConfig;
    import com.youku.VersionInfo;
    import com.youku.base.BaseSprite;
    import com.youku.core.CoreMediator;
    import com.youku.datas.FlashVars;
    import com.youku.events.PlayerProxyEvent;
    import com.youku.interfaces.IPlayerProxy;
    import com.youku.organs.rootview.view.RootViewMediator;
    import com.youku.proxys.ExternalProxy;
    import com.youku.proxys.PlayerProxy;
    import com.youku.utils.YaheiFontManager;
    
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.ui.ContextMenu;
    import flash.ui.ContextMenuItem;
    
    /**
     * 播放器
     * @author 潘启宝 2016年01月26日17:43:53
     * QQ 312919214
     */
    [SWF(backgroundColor = "0xFFFFFF", width = "640", height = "360", frameRate = "30")]
    public class VVP extends BaseSprite {
        private var _playerProxy:IPlayerProxy;
        private var _externalProxy:ExternalProxy;
        
        private var _coreMediator:CoreMediator;
        
        public function VVP() {
            super();
            this.stage ? init() : this.addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void {
            if (this.hasEventListener(Event.ADDED_TO_STAGE)) {
                this.removeEventListener(Event.ADDED_TO_STAGE, init);
            }
            
            var url:String = this.loaderInfo.url;
            url = url.substr(0, url.search(/\/[^\/]*\.swf/));
            PlayerConfig.baseURL = url;
            
            YaheiFontManager.setYaheiFont();
            
            initFlashVar();
            initContextMenu();
            initStageVariable();
            initProxy();
            initMediator();
            
            
            play(PlayerConfig.flashVars.src);
        }
        
        private function initFlashVar():void {
            PlayerConfig.flashVars = new FlashVars();
            PlayerConfig.flashVars.initData(stage.loaderInfo.parameters);
        }
        
        protected function initProxy():void {
            _playerProxy = new PlayerProxy();
            _externalProxy = new ExternalProxy();
            _externalProxy.addCallbacks();
        
        }
        
        protected function initMediator():void {
            var rootViewMediator:RootViewMediator = new RootViewMediator(this, _playerProxy);
            
            _coreMediator = new CoreMediator(rootViewMediator.videoLayer, _playerProxy);
            
            rootViewMediator.resetResize(); //此方法要在所有插件的后面调用
        }
        
        protected function initStageVariable():void {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            stage.tabChildren = false;
            stage.showDefaultContextMenu = false;
            stage.stageFocusRect = false;
        }
        
        protected function initContextMenu():void {
            var contextMenuItem:ContextMenuItem = new ContextMenuItem("VVP" + "【" + "版本:" + VersionInfo.ver() + "】", true, false, true);
            var contextMenu:ContextMenu = new ContextMenu();
            contextMenu.hideBuiltInItems();
            contextMenu.customItems.push(contextMenuItem);
            this.contextMenu = contextMenu;
        }
        
        public function load(value:Object = null):void { //重新加载音频/视频元素
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.LOAD, {src: value}));
        }
        
        public function play(value:Object = null):void { //开始播放音频/视频
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.PLAY, {src: value}));
        }
        
        public function pause(value:Object = null):void { //暂停当前播放的音频/视频 
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.PAUSE, {}));
        }
        
        public function set autoplay(value:Boolean):void { //设置或返回是否在加载完成后随即播放音频/视频 
            PlayerConfig.flashVars.autoplay = value;
        }
        
        public function get autoplay():Boolean { //设置或返回是否在加载完成后随即播放音频/视频 
            return PlayerConfig.flashVars.autoplay;
        }
        
        public function get buffered():Number { //返回表示音频/视频已缓冲部分的 TimeRanges 对象 
            return _coreMediator.buffered;
        }
        
        public function get currentSrc():String { //返回当前音频/视频的 URL 
            return PlayerConfig.baseURL;
        }
        
        public function set currentTime(value:Number):void { //设置或返回音频/视频中的当前播放位置（以秒计） 
            _coreMediator.seek(value);
        }
        
        public function get currentTime():Number { //设置或返回音频/视频中的当前播放位置（以秒计） 
            return _coreMediator.currentTime;
        }
        
        public function get duration():Number { //返回当前音频/视频的长度（以秒计） 
            return _coreMediator.duration;
        }
        
        public function get ended():Boolean { //返回音频/视频的播放是否已结束 
            return false;
        }
        
        public function get error():Object { //返回表示音频/视频错误状态的 MediaError 对象
            return null;
        }
        
        public function set loop(value:Boolean):void { //设置或返回音频/视频是否应在结束时重新播放 
            PlayerConfig.flashVars.loop = value;
        }
        
        public function get loop():Boolean { //设置或返回音频/视频是否应在结束时重新播放 
            return PlayerConfig.flashVars.loop;
        }
        
        public function set muted(value:Boolean):void { //设置或返回音频/视频是否静音 
            volume(0);
        }
        
        public function get muted():Boolean { //设置或返回音频/视频是否静音 
            return false;
        }
        
        public function get paused():Boolean { //返回音频/视频是否暂停 
            return false;
        }
        
        public function get seeking():Boolean { //返回用户是否正在音频/视频中进行查找 
            return false;
        }
        
        public function set src(value:String):void { //设置或返回音频/视频元素的当前来源
            PlayerConfig.flashVars.src = value;
        }
        
        public function get src():String { //设置或返回音频/视频元素的当前来源
            return PlayerConfig.flashVars.src;
        }
        
        public function set volume(value:Number):void { //设置或返回音频/视频的音量 
            _playerProxy.dispatchEvent(new PlayerProxyEvent(PlayerProxyEvent.CHANGE_VOLUME, {volume: value}));
        }
        
        public function get volume():Number { //设置或返回音频/视频的音量 
            return Number(PlayerConfig.flashVars.volume);
        }
    }
}
