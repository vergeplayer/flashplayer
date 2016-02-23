package com.youku.core.model {
    import flash.events.EventDispatcher;
    import flash.events.NetStatusEvent;
    import flash.net.NetConnection;
    
    public class Connection extends EventDispatcher {
        private var _netConnection:NetConnection;
        
        public function Connection() {
            super();
            
            init();
        }
        
        private function init():void {
            _netConnection = new NetConnection();
            _netConnection.client = this;
            _netConnection.connect(null);
            _netConnection.addEventListener(NetStatusEvent.NET_STATUS, netConnectionNetStatus);
        }
        
        protected function netConnectionNetStatus(e:NetStatusEvent):void {
            trace('netConnectionNetStatus---', "code:" + e.info.code, "description:" + e.info.description);
            switch (e.info.code) {
                case "NetConnection.Call.BadVersion": //	"error"	以不能识别的格式编码的数据包。
                    break;
                case "NetConnection.Call.Failed": //	"error"	NetConnection.call() 方法无法调用服务器端的方法或命令。
                    break;
                case "NetConnection.Call.Prohibited": //	"error"	Action Message Format (AMF) 操作因安全原因而被阻止。AMF URL 与文件（其中包含调用 NetConnection.call() 方法的代码）不在同一个域中，或者 AMF 服务器没有信任文件（其中包含调用 NetConnection.call() 方法的代码）所在域的策略文件。
                    break;
                case "NetConnection.Connect.AppShutdown": //	"error"	正在关闭服务器端应用程序。
                    break;
                case "NetConnection.Connect.Closed": //	"status"	成功关闭连接。
                    break;
                case "NetConnection.Connect.Failed": //	"error"	连接尝试失败。
                    break;
                case "NetConnection.Connect.IdleTimeout": //	"status"	Flash Media Server 断开了与客户端的连接，因为客户端的闲置时间已超过了 <MaxIdleTime> 的配置值。 在 Flash Media Server 上，<AutoCloseIdleClients> 默认情况下处于禁用状态。 启用时，默认超时值为 3600 秒（1 小时）。有关详细信息，请参阅 关闭闲置连接。
                    break;
                case "NetConnection.Connect.InvalidApp": //	"error"	对 NetConnection.connect() 的调用中指定的应用程序名称无效。
                    break;
                case "NetConnection.Connect.NetworkChange": //	"status"	Flash Player 检测到网络更改，例如，断开的无线连接、成功的无线连接或者网络电缆缺失。使用此事件检查网络接口更改。不要使用此事件实现 NetConnection 重新连接逻辑。使用 "NetConnection.Connect.Closed" 来实现 NetConnection 重新连接逻辑。
                    break;
                case "NetConnection.Connect.Rejected": //	"error"	连接尝试没有访问应用程序的权限。
                    break;
                case "NetConnection.Connect.Success": //	"status"	连接尝试成功。
                    break;
            }
        }
        
        public function get netConnection():NetConnection {
            return _netConnection;
        }
    
    }
}
