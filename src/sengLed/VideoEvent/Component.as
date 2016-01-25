package sengLed.VideoEvent 
{
	import flash.events.FullScreenEvent;
	import sengLed.VideoEvent.CustomEvent;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	/**
	 * ...发送自定义事件
	 * @author Jing.li
	 */
	public class Component extends Sprite
	{
		private var _obj:MovieClip;
		public function Component(obj:MovieClip) 
		{
			super();
			_obj = obj;
			obj.vidProgress.stopBtn.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			obj.vidProgress.startBtn.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			obj.videoControl.btn_mc.vodBtn.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			
			obj.videoControl.videoPlayPregress.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			obj.videoControl.videoPlayPregress.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			obj.videoControl.videoPlayPregressbg.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			obj.videoControl.videoPlayPregressbg.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		
			obj.vidProgress.kedu_mc.recordProgresSlider.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			obj.vidProgress.kedu_mc.recordProgresSlider.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			obj.vidProgress.kedu_mc.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			obj.vidProgress.kedu_mc.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			
			obj.videoControl.btn_mc.fullBtn.addEventListener(MouseEvent.CLICK, full_ScreenHandler);
			obj.videoControl.btn_mc.normalBtn.addEventListener(MouseEvent.CLICK, full_ScreenHandler);
		
			//音量控制处理
			obj.videoControl.btn_mc.vol_mc.volume.volumSlide.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			obj.videoControl.btn_mc.vol_mc.volume.volumSlide.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			obj.videoControl.btn_mc.volBtn.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			
			//Video亮度调节
			obj.light_mc.light.lightSlide.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			
			//Video放大区域鼠标事件
			obj.addMC.addAreaProgress.addSlide.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			obj.addMC.addBtn.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			obj.addMC.reduceBtn.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			
			//Video放大拖拽事件
			obj.vid_mc.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			obj.addEventListener(MouseEvent.MOUSE_MOVE, vid_MoveHandler);
			obj.videoControl.btn_mc.volBtn.addEventListener(MouseEvent.ROLL_OVER, vol_rollOverHandler);
			obj.videoControl.btn_mc.vol_mc.addEventListener(MouseEvent.ROLL_OUT, vol_rollOutHandler);
			
			obj.error_mc.RefreshBtn.addEventListener(MouseEvent.CLICK, mouseClickHandler);
		}
		
		private function vol_rollOutHandler(e:MouseEvent):void 
		{
			var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_VOL_OUT);
			e.currentTarget.dispatchEvent(event);
		}
		
		private function vol_rollOverHandler(e:MouseEvent):void 
		{
			var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_VOL_OVER);
			e.currentTarget.dispatchEvent(event);
		}
		
		private function vid_MoveHandler(e:MouseEvent):void 
		{
			var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_MOVE_MOUSE);
			e.currentTarget.dispatchEvent(event);
		}
		
		private function mouseClickHandler(e:MouseEvent):void
		{
			switch(e.currentTarget.name)
			{
				case "startBtn":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_PLAY);
					e.currentTarget.dispatchEvent(event);
					break;
				case "stopBtn":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_STOP);
					e.currentTarget.dispatchEvent(event);
					break;
				case "addBtn":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_BIG_CLCIK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "reduceBtn":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_SMALL_CLCIK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "volBtn":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VOLUME_CLICK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "vodBtn":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_CLICK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "RefreshBtn":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_REFRESH);
					e.currentTarget.dispatchEvent(event);
					break;
			}
		}
		private function mouseDownHandler(e:MouseEvent):void
		{
			switch(e.currentTarget.name)
			{
				case "recordProgresSlider":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_DOWN);
					e.currentTarget.dispatchEvent(event);
					break;
				case "videoPlayPregressbg":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_DOWN);
					e.currentTarget.dispatchEvent(event);
					break;
				case "videoPlayPregress":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_DOWN);
					e.currentTarget.dispatchEvent(event);
					break;	
				case"volumSlide":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VOLUME_DOWN_CLICK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "kedu_mc":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_DOWN);
					e.currentTarget.dispatchEvent(event);
					break;
				case "lightSlide":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.LIGHTSLIDE_DOWN_CLICK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "addSlide":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.AREAVIDEO_DOWN_CLICK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "vid_mc":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_STARTDRAG);
					e.currentTarget.dispatchEvent(event);
					_obj.vid_mc.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
					break;
			}
		}
		private function mouseUpHandler(e:MouseEvent):void
		{
			switch(e.currentTarget.name)
			{
				case "recordProgresSlider":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_UP);
					e.currentTarget.dispatchEvent(event);
					break;
				case "videoPlayPregressbg":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_UP);
					e.currentTarget.dispatchEvent(event);
					break;
				case"volumSlide":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VOLUME_UP_CLICK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "videoPlayPregress":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_UP);
					e.currentTarget.dispatchEvent(event);
					break;
				case "kedu_mc":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.PROCESS_MOUSE_UP);
					e.currentTarget.dispatchEvent(event);
					break;
				case "addSlide":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.AREAVIDEO_UP_CLICK);
					e.currentTarget.dispatchEvent(event);
					break;
				case "vid_mc":
					var event:sengLed.VideoEvent.CustomEvent = new sengLed.VideoEvent.CustomEvent(sengLed.VideoEvent.CustomEvent.VIDEO_STOPDRAG);
					e.currentTarget.dispatchEvent(event);
					break;
			}
		}
		private function full_ScreenHandler(e:MouseEvent):void
		{
			var event:CustomEvent = new CustomEvent(CustomEvent.VIDEO_FULLSCREEN);
			e.currentTarget.dispatchEvent(event);	
		}
		private function videoModeClickHandler(e:MouseEvent):void
		{
			var event:CustomEvent = new CustomEvent(CustomEvent.VIDEO_MODE_CLICK);
			e.currentTarget.dispatchEvent(event);	
		}
	}

}