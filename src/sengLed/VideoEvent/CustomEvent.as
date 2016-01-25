package sengLed.VideoEvent 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Jing.li
	 */
	public class CustomEvent extends Event 
	{
		public static const VIDEO_PLAY:String = "VIDEO_PLAY";//开始播放
		public static const VIDEO_STOP:String = "VIDEO_STOP";//停止播放
		public static const VIDEO_CLICK:String = "VIDEO_CLICK";
		public static const VIDEO_FULLSCREEN:String = "VIDEO_FULLSCREEN";//全屏
		public static const VIDEO_NORMAL:String = "VIDEO_NORMAL";//正常
		
		public static const VIDEO_MODE_CLICK:String = "VIDEO_MODE_CLICK";//视频播放模式
		public static const PROCESS_MOUSE_DOWN:String = "PROCESS_MOUSE_DOWN";//视频进度按下事件
		public static const PROCESS_MOUSE_UP:String = "PROCESS_MOUSE_UP";//视频播放进度抬起事件

		public static const VIDEO_BIG_CLCIK:String = "VIDEO_BIG_CLCIK";//视频放大
		public static const VIDEO_SMALL_CLCIK:String = "VIDEO_SMALL_CLCIK";//视频缩小
		
		public static const VOLUME_DOWN_CLICK:String = "VOLUME_DOWN_CLICK";//音量按下事件
		public static const VOLUME_UP_CLICK:String = "VOLUME_UP_CLICK";//音量抬起事件
		public static const VOLUME_CLICK:String = "VOLUME_CLICK";
		
		public static const LIGHTSLIDE_DOWN_CLICK:String = "LIGHTSLIDE_DOWN_CLICK";//视频亮度调节
		public static const LIGHTSLIDE_UP_CLICK:String = "LIGHTSLIDE_UP_CLICK";
		
		public static const AREAVIDEO_DOWN_CLICK:String = "AREAVIDEO_DOWN_CLICK";//视频滑块调节大小
		public static const AREAVIDEO_UP_CLICK:String = "AREAVIDEO_UP_CLICK";
		
		public static const VIDEO_STARTDRAG:String = "VIDEO_STARTDRAG";//视频拖拽事件
		public static const VIDEO_STOPDRAG:String = "VIDEO_STOPDRAG";
		
		public static const VOD_VIDEO:String = "VOD_VIDEO";//视频点播
		public static const VIDEO_MOVE_MOUSE:String = "VIDEO_MOVE_MOUSE";
		public static const VIDEO_VOL_OUT:String = "VIDEO_VOL_OUT";
		public static const VIDEO_VOL_OVER:String = "VIDEO_VOL_OVER";
		public static const VIDEO_REFRESH:String = "VIDEO_REFRESH";
		public function CustomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	
		
	}

}