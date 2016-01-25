package 
{
	import flash.events.TimerEvent;
	import flash.net.ObjectEncoding;
	import flash.utils.Timer;
	import sengLed.Controller.VideoPlay;
	import flash.events.NetDataEvent;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.net.Responder;
	import sengLed.RectDraw;
	/**
	 * ...
	 * @author Jing.li
	 */
	public class Red5 
	{
		private var _nc:NetConnection;
		public var _responder:Responder;
		private var _connect:Boolean;
		
		public function Red5() 
		{
			trace("-----------------Red5--------------------");
			_nc = new NetConnection();
			Parameter.getInstance().nc = _nc;
			_nc.addEventListener(NetStatusEvent.NET_STATUS, net_statusHandler);
			Parameter.getInstance().red5 = this;
		}
		
		private function net_statusHandler(e:NetStatusEvent):void
		{
			trace(e.info.code);
			switch(e.info.code)
			{
				case "NetConnection.Connect.Success":
					Parameter.getInstance().main._vidPlay = new sengLed.Controller.VideoPlay();
					if (Global.videoListLength > 0)
					{
						Parameter.getInstance().main._vidPlay.nextVideo();
					}
					break;
				case "NetConnection.Connect.Failed":
					reconnect();
					break;
				case "NetConnection.Connect.Close":
                    break;

			}
		}
		private function reconnect():void
		{
			_nc = new NetConnection();
			_nc.addEventListener(NetStatusEvent.NET_STATUS, net_statusHandler);
			_nc.connect(Global.rtmpAddress);
		}
		
	}

}