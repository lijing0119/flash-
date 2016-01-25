package 
{
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	/**
	 * ...
	 * @author Jing.li
	 */
	public class Parameter 
	{
		private var _videoWidth:Number=780;//视频宽度
		private var _videoHeight:Number = 0;//视频高度
		private var _videoWidthMin:Number;//视频宽度
		private var _videoHeightMin:Number;//视频高度
		private var _isPlayerBool:Boolean;//是否播放
		private var _VideoSmoothing:Boolean;//视频是否平滑处理
		private var _red5:Red5;
		private var _nc:NetConnection;
		private var _connected:Boolean;//是否连接red5
		private var _playName:String;//视频播放流名称
		private var _main:Main;//指定入口函数
		private var _actionState:Boolean;//video播放任意点
		private var _videoMode:String = "vod";//video播放模式
		private var _ns:NetStream;//创建音视频流
		private var _gsStatusBool:Boolean;//gs循环状态视频播放状态
		private var _durNum:Number = 0;//video播放持续时间；
		private var _totalSec:Number = 60 * 60 * 24;//24小时总秒数
		private var _currDateTime:Number;//当前时间点总的秒数
		private var _alphaV:Number = 0;//亮度值
		private var _lightBool:Boolean;
		private var _videoAreaBool:Boolean;//放大区域控制
		private var _volumeBool:Boolean;//音量进度
		private var _volBtnBool:Boolean;//音量背景框
		private var _videoMoveBool:Boolean;//video放大区域
		private var _scaleV:Number = 1;//video缩放区域默认值
		private var _recordBool:Boolean;
		private var _recordX:Number;
		private var _recordBlag:String = "false";
		private var _recordClickBlag:String="false";
		private var _screenBool:Boolean;
		private var _continueTime:Number=0;
		private var _mainH:Number=450;
		private var _mainW:Number=780;
		private var _mainX:Number=395.35;
		private var _mainY:Number = 230.05;
		private var _videoShift:Number = 0;
		private var _progressWidth:Number = 780;
		private var _videoControlWidth:Number = 780;
		private var _nextNum:Number = 0;
		private static var _instance:Parameter;
		
		
		public static function getInstance():Parameter
		{
			if (_instance == null)
			{
				_instance = new Parameter();
			}
			return _instance;
		}
		
		public function get videoWidth():Number 
		{
			return _videoWidth;
		}
		
		public function set videoWidth(value:Number):void 
		{
			_videoWidth = value;
		}
		
		public function get videoHeight():Number 
		{
			return _videoHeight;
		}
		
		public function set videoHeight(value:Number):void 
		{
			_videoHeight = value;
		}
		
		public function get isPlayerBool():Boolean 
		{
			return _isPlayerBool;
		}
		
		public function set isPlayerBool(value:Boolean):void 
		{
			_isPlayerBool = value;
		}
		
		public function get VideoSmoothing():Boolean 
		{
			return _VideoSmoothing;
		}
		
		public function set VideoSmoothing(value:Boolean):void 
		{
			_VideoSmoothing = value;
		}
		
		public function get red5():Red5 
		{
			return _red5;
		}
		
		public function set red5(value:Red5):void 
		{
			_red5 = value;
		}
		public function get nc():NetConnection 
		{
			return _nc;
		}
		
		public function set nc(value:NetConnection):void 
		{
			_nc = value;
		}
		
		public function get connected():Boolean 
		{
			return _connected;
		}
		
		public function set connected(value:Boolean):void 
		{
			_connected = value;
		}
		public function get playName():String 
		{
			return _playName;
		}
		
		public function set playName(value:String):void 
		{
			_playName = value;
		}
		
		public function get main():Main 
		{
			return _main;
		}
		
		public function set main(value:Main):void 
		{
			_main = value;
		}
		
		public function get actionState():Boolean 
		{
			return _actionState;
		}
		
		public function set actionState(value:Boolean):void 
		{
			_actionState = value;
		}
		
		public function get videoMode():String 
		{
			return _videoMode;
		}
		
		public function set videoMode(value:String):void 
		{
			_videoMode = value;
		}
		
		public function get ns():NetStream 
		{
			return _ns;
		}
		
		public function set ns(value:NetStream):void 
		{
			_ns = value;
		}
		
		public function get gsStatusBool():Boolean 
		{
			return _gsStatusBool;
		}
		
		public function set gsStatusBool(value:Boolean):void 
		{
			_gsStatusBool = value;
		}
		
		public function get durNum():Number 
		{
			return _durNum;
		}
		
		public function set durNum(value:Number):void 
		{
			_durNum = value;
		}
		
		public function get totalSec():Number 
		{
			return _totalSec;
		}
		
		public function set totalSec(value:Number):void 
		{
			_totalSec = value;
		}
		
		public function get currDateTime():Number 
		{
			return _currDateTime;
		}
		
		public function set currDateTime(value:Number):void 
		{
			_currDateTime = value;
		}
		
		public function get alphaV():Number 
		{
			return _alphaV;
		}
		
		public function set alphaV(value:Number):void 
		{
			_alphaV = value;
		}
		
		public function get lightBool():Boolean 
		{
			return _lightBool;
		}
		
		public function set lightBool(value:Boolean):void 
		{
			_lightBool = value;
		}
		
		public function get videoAreaBool():Boolean 
		{
			return _videoAreaBool;
		}
		
		public function set videoAreaBool(value:Boolean):void 
		{
			_videoAreaBool = value;
		}
		
		public function get volumeBool():Boolean 
		{
			return _volumeBool;
		}
		
		public function set volumeBool(value:Boolean):void 
		{
			_volumeBool = value;
		}
		
		public function get volBtnBool():Boolean 
		{
			return _volBtnBool;
		}
		
		public function set volBtnBool(value:Boolean):void 
		{
			_volBtnBool = value;
		}
		
		public function get videoMoveBool():Boolean 
		{
			return _videoMoveBool;
		}
		
		public function set videoMoveBool(value:Boolean):void 
		{
			_videoMoveBool = value;
		}
		
		public function get scaleV():Number 
		{
			return _scaleV;
		}
		
		public function set scaleV(value:Number):void 
		{
			_scaleV = value;
		}
		
		public function get screenBool():Boolean 
		{
			return _screenBool;
		}
		
		public function set screenBool(value:Boolean):void 
		{
			_screenBool = value;
		}
		public function get mainH():Number 
		{
			return _mainH;
		}
		
		public function set mainH(value:Number):void 
		{
			_mainH = value;
		}
		
		public function get mainW():Number 
		{
			return _mainW;
		}
		
		public function set mainW(value:Number):void 
		{
			_mainW = value;
		}
		
		public function get mainX():Number 
		{
			return _mainX;
		}
		
		public function set mainX(value:Number):void 
		{
			_mainX = value;
		}
		
		public function get mainY():Number 
		{
			return _mainY;
		}
		
		public function set mainY(value:Number):void 
		{
			_mainY = value;
		}
		
		public function get progressWidth():Number 
		{
			return _progressWidth;
		}
		
		public function set progressWidth(value:Number):void 
		{
			_progressWidth = value;
		}
		
		public function get videoControlWidth():Number 
		{
			return _videoControlWidth;
		}
		
		public function set videoControlWidth(value:Number):void 
		{
			_videoControlWidth = value;
		}
		
		public function get videoWidthMin():Number 
		{
			return _videoWidthMin;
		}
		
		public function set videoWidthMin(value:Number):void 
		{
			_videoWidthMin = value;
		}
		
		public function get videoHeightMin():Number 
		{
			return _videoHeightMin;
		}
		
		public function set videoHeightMin(value:Number):void 
		{
			_videoHeightMin = value;
		}
		
		public function get continueTime():Number 
		{
			return _continueTime;
		}
		
		public function set continueTime(value:Number):void 
		{
			_continueTime = value;
		}
		
		public function get recordBool():Boolean 
		{
			return _recordBool;
		}
		
		public function set recordBool(value:Boolean):void 
		{
			_recordBool = value;
		}
		
		public function get recordX():Number 
		{
			return _recordX;
		}
		
		public function set recordX(value:Number):void 
		{
			_recordX = value;
		}
		
		public function get recordBlag():String 
		{
			return _recordBlag;
		}
		
		public function set recordBlag(value:String):void 
		{
			_recordBlag = value;
		}
		
		public function get recordClickBlag():String 
		{
			return _recordClickBlag;
		}
		
		public function set recordClickBlag(value:String):void 
		{
			_recordClickBlag = value;
		}
		
		public function get videoShift():Number 
		{
			return _videoShift;
		}
		
		public function set videoShift(value:Number):void 
		{
			_videoShift = value;
		}
		
		public function get nextNum():Number 
		{
			return _nextNum;
		}
		
		public function set nextNum(value:Number):void 
		{
			_nextNum = value;
		}
		
		public function Parameter() 
		{
			if (_instance)
			{
				 throw new Error("只能用getInstance()来获取实例");
			}
			
		}
	}

}