package com.youku.proxys {
    import com.youku.utils.FSOManager;
    
    public class FSOProxy {
        public static const FSO_PROXY:String = "FSO_PROXY";
        
        private var _fso:FSOManager;
        
        public function FSOProxy() {
        
        }
        
        public function init():void {
            _fso = new FSOManager(FSO_PROXY, "/");
        }
        
        // the volume mute
        public function setMute(mute:Boolean):void {
            CONFIG::TEST {
                return;
            }
            CONFIG::TUDOU {
                return;
            }
            if (!_fso) {
                return;
            }
            _fso.save("mute", mute, null, true);
        }
        
        public function getMute():Boolean {
            if (_fso == null) {
                return false;
            }
            var mute:Object = _fso.load("mute");
            if (mute != null) {
                return (mute == true);
            }
            return false;
        }
        
        // the volume
        public function setVolume(v:Number):void {
            CONFIG::TEST {
                return;
            }
            CONFIG::TUDOU {
                return;
            }
            if (!_fso) {
                return;
            }
            _fso.save("volume", v, null, true);
        }
        
        public function getVolume():Number {
            if (_fso == null) {
                return 0.5;
            }
            var volume:Object = _fso.load("volume");
            if (volume != null && !isNaN(Number(volume))) {
                return Number(volume);
            }
            return 0.5;
        }
        
        // the continuous status
        public function setContinuous(b:Boolean):void {
            if (!_fso) {
                return;
            }
            _fso.save("continuous", b, null, true);
        }
        
        public function getContinuous():Boolean {
            if (_fso == null) {
                return true;
            }
            var continuous:Object = _fso.load("continuous");
            if (continuous != null) {
                return (continuous == true);
            }
            return true;
        }
        
        // the jump head and tail
        public function setJump(b:Boolean):void {
            if (!_fso) {
                return;
            }
            _fso.save("jump", b, null, true);
        }
        
        public function getJump():Boolean {
            if (_fso == null) {
                return true;
            }
            var jump:Object = _fso.load("jump");
            if (jump != null) {
                return (jump == true);
            }
            return true;
        }
        
        // the default quality 
        public function setDefaultQuality(type:String):void {
            if (!_fso) {
                return;
            }
            var quality:String = (type == "1080P") ? "high" : type;
            _fso.save("quality", quality, null, true);
        }
        
        /*public function getDefaultQuality() : String {
            if (_fso == null) {
                return PlayerConstant.QUALITY_AUTO;
            }
            var quality:Object = _fso.load("quality");
            if(quality != null)
            {
                return quality as String;
            }
            return PlayerConstant.QUALITY_AUTO;
        }*/
        
        public function setDefaultQualityTime(time:Number):void {
            if (!_fso) {
                return;
            }
            _fso.save("qualityTime", time, null, true);
        }
        
        public function getDefaultQualityTime():Number {
            if (_fso == null) {
                return 0;
            }
            var time:Object = _fso.load("qualityTime");
            if (time != null) {
                return time as Number;
            }
            return 0;
        }
        
        // default voice
        public function setDefaultVoice(voice:String):void {
            if (!_fso) {
                return;
            }
            _fso.save("voice", voice, null, true);
        }
        
        public function getDefaultVoice():String {
            if (_fso == null) {
                return "default";
            }
            var voice:Object = _fso.load("voice");
            if (voice != null) {
                return voice as String;
            }
            return "default";
        }
        
        // GUID
        public function setGUID(guid:String):void {
            if (!_fso) {
                return;
            }
            _fso.save("GUID", guid, null, true);
        }
        
        public function getGUID():String {
            if (_fso == null) {
                return null;
            }
            var guid:Object = _fso.load("GUID");
            if (guid != null) {
                return guid as String;
            }
            return null;
        }
        
        // watch record
        public function saveUserWatchingRecord(videoid:String, position:Number):void {
            if (_fso == null)
                return;
            
            var info:Object = _fso.load("playingRecords");
            if (info == null) {
                info = new Object();
            }
            
            info[videoid] = {position: position, time: new Date().getTime()};
            _fso.save("playingRecords", info, null, true);
        }
        
        public function removeUserWatchingRecord(videoid:String):void {
            if (_fso == null)
                return;
            
            var info:Object = _fso.load("playingRecords");
            if (info != null) {
                if (info[videoid] != null) {
                    delete info[videoid];
                    _fso.save("playingRecords", info, null, true);
                }
            }
        }
        
        public function hasUserWatchingRecord(videoid:String):Boolean {
            if (_fso == null)
                return false;
            var info:Object = _fso.load("playingRecords");
            if (info != null) {
                if (info[videoid] != null && info[videoid] !== undefined) {
                    return true;
                }
            }
            return false;
        }
        
        public function getUserWatchingRecord(videoid:String):Object {
            if (_fso == null) {
                return null;
            }
            
            var info:Object = _fso.load("playingRecords");
            if (info != null) {
                if (info[videoid] != null && info[videoid] !== undefined) {
                    var record:Object = info[videoid];
                    
                    if (record.position != null) {
                        return {position: record.position, time: record.time};
                    }
                }
            }
            return null;
        }
        
        // 只记录30条以下的播放器记录。超过30条播放记录的时候，按照记录时间排序，把最久远的播放记录清除
        public function clearUserWatchingRecord():void {
            if (_fso == null) {
                return;
            }
            
            var info:Object = _fso.load("playingRecords");
            var records:Array = [];
            if (info != null) {
                for (var id:String in info) {
                    var record:Object = {};
                    record.videoid = id;
                    record.position = info[id].position;
                    record.time = info[id].time;
                    records.push(record);
                }
            }
            
            //如果播放记录小于30条，那么不清理
            if (records.length <= 30) {
                return;
            }
            
            records.sort(sortOnTime, Array.DESCENDING);
            records = records.slice(0, 30);
            info = new Object();
            for (var i:int = 0; i < records.length; i++) {
                record = records[i];
                info[record.videoid] = {position: record.position, time: record.time};
            }
            _fso.save("playingRecords", info, null, true);
        }
        
        private function sortOnTime(left:Object, right:Object):Number {
            if (left.time > right.time) {
                return 1;
            } else if (left.time < right.time) {
                return -1;
            } else {
                return 0;
            }
        }
        
        public function saveDownloadSpeeds(code:String, speeds:Array):void {
            if (_fso == null)
                return;
            
            var info:Object = _fso.load("speeds");
            if (info == null) {
                info = new Object();
            }
            if (info[code] === undefined || info[code] == null) {
                info[code] = new Array();
            }
            
            info[code] = speeds;
            
            _fso.save("speeds", info, null, true);
        }
        
        public function saveDownloadSpeed(code:String, speed:Number):void {
            
            if (_fso == null)
                return;
            
            var info:Object = _fso.load("speeds");
            if (info == null) {
                info = new Object();
            }
            if (info[code] === undefined || info[code] == null) {
                info[code] = new Array();
            }
            
            info[code].push({s: speed, time: new Date().getTime()});
            
            _fso.save("speeds", info, null, true);
        }
        
        public function getDownloadSpeed(code:String):Array {
            if (_fso == null)
                return [];
            
            var info:Object = _fso.load("speeds");
            if (info == null) {
                return [];
            }
            
            var arr:Array = new Array();
            if (info[code] !== undefined && info[code] != null) {
                arr = info[code] as Array;
            }
            return arr;
        }
        
        public function saveADHoldingInfo(info:Object):void {
            if (_fso == null) {
                return;
            }
            _fso.save("adHoldingInfo", info, null, true);
        }
        
        public function getADHoldingInfo():Object {
            if (_fso == null) {
                return {};
            }
            var info:Object = _fso.load("adHoldingInfo");
            if (info == null) {
                return {};
            }
            return info;
        }
        
        public function saveADRefreshInfo(info:Object):void {
            if (_fso == null) {
                return;
            }
            _fso.save("adRefreshInfo", info, null, true);
        }
        
        public function getADRefreshInfo():Object {
            if (_fso == null) {
                return {};
            }
            var info:Object = _fso.load("adRefreshInfo");
            if (info == null) {
                return {};
            }
            return info;
        }
        
        /* 站外顶踩 */
        public function saveUpDownInfo(vid:String, time:Number, type:String):void {
            if (_fso == null)
                return;
            var data:Array = _fso.load("upDown") as Array;
            if (data == null || data.length == 0) {
                data = new Array();
            } else {
                /* 删除超过24小时的数据 */
                var t:Number = new Date().getTime();
                for (var i:int = data.length - 1; i > -1; i--) {
                    var obj:Object = data[i];
                    if (t - Number(obj.time) > 24 * 60 * 60 * 1000) {
                        data.splice(i, 1);
                    }
                }
            }
            data.push({"vid": vid, "time": time, "type": type});
            
            _fso.save("upDown", data, null, true);
        }
        
        public function getUpDownInfo():Array {
            if (_fso == null) {
                return new Array();
            }
            var data:Array = _fso.load("upDown") as Array;
            if (data == null) {
                return new Array();
            }
            return data;
        }
        
        public function saveADTimeInfo(info:Number):void {
            if (_fso == null)
                return;
            
            _fso.save("ADTime", info, null, true);
        }
        
        public function getADTimeInfo():Number {
            if (_fso == null) {
                return 0;
            }
            var data:Object = _fso.load("ADTime");
            if (data == null) {
                return 0;
            }
            var time:Number = data as Number;
            return time;
        }
        
        public function saveLoopSetting(isLoop:Boolean):void {
            if (!_fso) {
                return;
            }
            _fso.save("loop", isLoop, null, true);
        }
        
        public function getLoopSetting():Boolean {
            if (_fso == null) {
                return false;
            }
            var obj:Object = _fso.load("loop");
            if (obj != null) {
                return obj as Boolean;
            }
            return false;
        }
        
        public function saveScreenMode(mode:String):void {
            if (!_fso) {
                return;
            }
            _fso.save("screen", mode, null, true);
        }
        
        public function saveTipsSetting(buttonName:String):void {
            if (!_fso) {
                return;
            }
            var obj:Object = _fso.load("tips");
            if (obj == null) {
                obj = {};
            }
            obj[buttonName] = true;
            _fso.save("tips", obj, null, true);
        }
        
        public function getTipsSetting(buttonName:String):Boolean {
            if (_fso == null) {
                return false;
            }
            var obj:Object = _fso.load("tips");
            if (obj != null) {
                return obj[buttonName] as Boolean;
            }
            return false;
        }
    }
}
