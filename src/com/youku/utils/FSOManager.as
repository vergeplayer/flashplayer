package com.youku.utils {
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.NetStatusEvent;
    import flash.net.ObjectEncoding;
    import flash.net.SharedObject;
    import flash.net.SharedObjectFlushStatus;
    import flash.utils.clearInterval;
    import flash.utils.getQualifiedClassName;
    import flash.utils.setInterval;
    
    public class FSOManager extends EventDispatcher {
        public static const EVENT_ERROR:String = "FSOManager.event_error";
        public static const EVENT_FLUSHED:String = "FSOManager.event_flushed";
        public static const EVENT_FLUSHING:String = "FSOManager.event_flushing";
        
        private var _firstUse:Boolean;
        private var _flushInterval:int;
        private var _flushPending:Boolean;
        private var _intervalID:int;
        private var _keys:Array;
        private var _settings:*;
        private var _shouldFlush:Boolean;
        
        // localID is the string used to register the Flash Shared Object. Ensure that
        //     it is distinct amongst all FSOs for a given domain/path.
        // flushInterval specifies the time in ms between an intervaled flush to disc
        //     (the save method is only in memory). The default value of -1 causes
        //     no intervaled flush to occur.
        public function FSOManager(localID:String, localPath:String = null, flushInterval:int = -1) {
            _intervalID = -1;
            _flushPending = false;
            _shouldFlush = true;
            SharedObject.defaultObjectEncoding = ObjectEncoding.AMF0;
            
            //load shared object and watch it for status changes
            try {
                _settings = SharedObject.getLocal(localID, localPath);
                _settings.objectEncoding = ObjectEncoding.AMF0;
                _settings.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
            }
            catch(e:Error) {
                _settings = new Object();
                _settings.data = {};
            }
            _keys = new Array();
            
            // can use this for a welcome screen or something
            if (_settings.data == null || _settings.size == 0) {
                _firstUse = true;
            }
            
            // register all existing keys
            for (var key:Object in _settings.data) {
               _keys.push(key); 
            }
            
            //start flush timer
            startFlushInterval(flushInterval);
        }
        
        public function get isFirstUse():Boolean {
            return _firstUse;
        }
        
        public function get settingsKeys():Array {
            return _keys;
        }
        
        public function clear(key:Object):void {
            var idx:int = _keys.indexOf(key);
            if (idx != -1) {
                delete _settings.data[key];
                _keys.splice(idx, 1);
            }
        }
        
        public function clearAll():void {
            for each (var key:Object in _keys) {
                delete _settings.data[key];
            }
            //clear keys
            _keys.splice(0, _keys.length);
        }
        
        public function flush():void {
            if (!_shouldFlush) {
                return;
            }
            
            if (_flushPending) {
                return;
            }
            
            dispatchEvent(new Event(EVENT_FLUSHING));
            
            try {
                if (_settings.flush() == SharedObjectFlushStatus.PENDING) {
                    _flushPending = true;
                }
            }
            catch (e:Error) {
                // According to spec, flush() could throw an exception
                //dispatchEvent(new Event(EVENT_ERROR));
            }
        }
        
        public function load(key:Object, thisRef:* = null):Object {
            // if settings doesn't exist skip
            if (_settings.data == null) {
                return null;
            }
            
            // the real key combines the thisRef with the given key
            var realKey:String = (thisRef == null) ? key.toString() : getQualifiedClassName(thisRef) + key.toString();
            return _settings.data[realKey];
        }
        
        private function onNetStatus(e:NetStatusEvent):void {
            // No matter the outcome, the pending save is complete
            _flushPending = false;
            
            // Remember that we shouldn't save in the future.
            if (e.info.level == "error") {
                _shouldFlush = false;
                dispatchEvent(new Event(EVENT_ERROR));
            }
            else {
                dispatchEvent(new Event(EVENT_FLUSHED));
            }
        }
        
        // Note that the specified key need only be distinct amongst objects with the same class/type
        public function save(key:Object, val:Object, thisRef:* = null, flushNow:Boolean = false):void {
            // the real key combines the thisRef with the given key
            var realKey:String = (thisRef == null) ? key.toString() : getQualifiedClassName(thisRef) + key.toString();
            _settings.data[realKey] = val;
            
            // if key doesn't exist yet, add it to collection
            if (_keys.indexOf(realKey) == -1) {
                _keys.push(realKey);
            }
            
            if (flushNow || _flushInterval == -1) {
                flush();
            }
        }
        
        public function startFlushInterval(flushInterval:Number):void {
            _flushInterval = flushInterval;
            
            if (_flushInterval > 0) {
                _intervalID = setInterval(flush, _flushInterval);
            }
        }
        
        public function stopFlushInterval():void {
            if (_intervalID != -1) {
                clearInterval(_intervalID);
            }
            _intervalID = -1;
        }
    }
}