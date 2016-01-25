package sengLed.VideoEvent 
{
	import adobe.utils.CustomActions;
	import com.greensock.TweenLite;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.ui.Mouse;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	import sengLed.VideoEvent.Component;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import sengLed.VideoSeting;
	import com.greensock.TweenMax;
	/**
	 * ...
	 * @author Jing.li
	 */
	public class ActionEvent extends Sprite  
	{
		private var _comp:sengLed.VideoEvent.Component;
		private var _sp:MovieClip;
		private var _videoSeting:VideoSeting;
		private var _preDownTime:int = 0;
		private const UP_INTER:int = 300;
        private var _preUpTime:int = 0;
		private var _timer:Timer;
		public function ActionEvent(sp:MovieClip) 
		{
			_sp = sp;
			_comp = new sengLed.VideoEvent.Component(_sp);
			_videoSeting = new VideoSeting();
			sp.vidProgress.stopBtn.addEventListener(CustomEvent.VIDEO_STOP, mouseClickHandler);
			sp.vidProgress.startBtn.addEventListener(CustomEvent.VIDEO_PLAY, mouseClickHandler);
			sp.videoControl.btn_mc.vodBtn.addEventListener(CustomEvent.VIDEO_CLICK, mouseClickHandler);
			
			sp.videoControl.videoPlayPregress.addEventListener(CustomEvent.PROCESS_MOUSE_DOWN, progressDownHandler);
			sp.videoControl.videoPlayPregressbg.addEventListener(CustomEvent.PROCESS_MOUSE_DOWN, progressDownHandler);
			
			sp.vidProgress.kedu_mc.recordProgresSlider.addEventListener(CustomEvent.PROCESS_MOUSE_DOWN, recordProgressDownHandler);
			//sp.vidProgress.kedu_mc.recordProgresSlider.addEventListener(CustomEvent.PROCESS_MOUSE_UP, recordProgressUpHandler);
			sp.vidProgress.kedu_mc.addEventListener(CustomEvent.PROCESS_MOUSE_DOWN, recordProgressDownHandler);
			//sp.vidProgress.kedu_mc.addEventListener(CustomEvent.PROCESS_MOUSE_UP, recordProgressUpHandler);
			
			sp.videoControl.btn_mc.vol_mc.volume.volumSlide.addEventListener(CustomEvent.VOLUME_DOWN_CLICK, progressDownHandler);
			sp.videoControl.btn_mc.volBtn.addEventListener(CustomEvent.VOLUME_CLICK, mouseClickHandler);
			
			sp.videoControl.btn_mc.fullBtn.addEventListener(CustomEvent.VIDEO_FULLSCREEN, video_FullScreenHandler);
			sp.videoControl.btn_mc.normalBtn.addEventListener(CustomEvent.VIDEO_FULLSCREEN, video_FullScreenHandler);
			
			sp.light_mc.light.lightSlide.addEventListener(CustomEvent.LIGHTSLIDE_DOWN_CLICK, progressDownHandler);
			
			//Video放大区域鼠标事件
			sp.addMC.addAreaProgress.addSlide.addEventListener(CustomEvent.AREAVIDEO_DOWN_CLICK,progressDownHandler);
			sp.addMC.addBtn.addEventListener(CustomEvent.VIDEO_BIG_CLCIK,mouseClickHandler);
			sp.addMC.reduceBtn.addEventListener(CustomEvent.VIDEO_SMALL_CLCIK, mouseClickHandler);
			
			Parameter.getInstance().main._vidColl.addEventListener(MouseEvent.MOUSE_UP, stageUpHandler);
			sp.vid_mc.addEventListener(CustomEvent.VIDEO_STARTDRAG, progressDownHandler);
			sp.addEventListener(CustomEvent.VIDEO_MOVE_MOUSE, vid_MoveHandler);
			
			sp.videoControl.btn_mc.volBtn.addEventListener(CustomEvent.VIDEO_VOL_OVER, vol_rollOverHandler);
			sp.videoControl.btn_mc.vol_mc.addEventListener(CustomEvent.VIDEO_VOL_OUT, vol_rollOutHandler);
			sp.error_mc.RefreshBtn.addEventListener(CustomEvent.VIDEO_REFRESH, mouseClickHandler);
			_timer = new Timer(7000);
			_timer.addEventListener(TimerEvent.TIMER, timerHandler);
			_timer.start();
		}
		
		private function vol_rollOutHandler(e:CustomEvent):void 
		{
			Parameter.getInstance().volBtnBool = false;
			_sp.videoControl.btn_mc.vol_mc.visible = false;
		}
		
		private function vol_rollOverHandler(e:CustomEvent):void 
		{
			//Parameter.getInstance().volBtnBool = true;
			//_sp.videoControl.btn_mc.vol_mc.visible = true;
		}
		
		private function timerHandler(e:TimerEvent):void 
		{
			_timer.stop();
			Mouse.hide();
			_videoSeting.videoControlIsShow(_sp.videoControl,0);
		}
		
		private function vid_MoveHandler(e:CustomEvent):void 
		{
			_timer.start();
			Mouse.show();
			_videoSeting.videoControlIsShow(_sp.videoControl, 1);
		}
		private function mouseClickHandler(e:CustomEvent):void
		{
			switch(e.currentTarget.name)
			{
				case "addBtn":
					_videoSeting.videoBig(_sp.addMC.addAreaProgress.addSlide);
					break;
				case "reduceBtn":
					_videoSeting.videoSmall(_sp.addMC.addAreaProgress.addSlide);
					break;
				case "stopBtn":
					Parameter.getInstance().main._vidPlay.Pause();
					_sp.vidProgress.startBtn.visible = true;
					_sp.vidProgress.stopBtn.visible = false;
					_sp.stopBig_mc.visible = true;
					break;
				case "startBtn":
					Parameter.getInstance().main._vidPlay.resume();
					_sp.vidProgress.startBtn.visible = false;
					_sp.vidProgress.stopBtn.visible = true;
					_sp.stopBig_mc.visible = false;
					break;
				case "vodBtn":
					Parameter.getInstance().main._vidPlay.closeStream();
					if (ExternalInterface.available) {
						ExternalInterface.call("sendToJavaScript", "0");
						_videoSeting.videoPregress(true);
					}
					break;
				case "volBtn":
					_videoSeting.volumeProgress(_sp.videoControl.btn_mc.vol_mc);
					break;
				case "RefreshBtn":
					//ExternalInterface.call('sendRefresh', 'error');
					Parameter.getInstance().main._vidPlay.Play(Global.obj.list[Parameter.getInstance().nextNum].playUrl);
					break;
			}
		}
	
		/**
		 * 视频，音量控制
		 * @param	e
		 */
		private function progressDownHandler(e:CustomEvent):void
		{
			
			switch(e.currentTarget.name)
			{
				case "videoPlayPregress":
					_videoSeting.playPregressDown(_sp.videoControl.videoPlayPregress, _sp.vidProgress.kedu_mc.recordProgresSlider,_sp.videoControl.videoPlayPregressbg,_sp.vidProgress.kedu_mc.kedubg);
					break;
				case "videoPlayPregressbg":
					_videoSeting.playPregressDown(_sp.videoControl.videoPlayPregress, _sp.vidProgress.kedu_mc.recordProgresSlider, _sp.videoControl.videoPlayPregressbg, _sp.vidProgress.kedu_mc.kedubg);
					break;
				case"volumSlide":
					Parameter.getInstance().volumeBool = true;
					_videoSeting.videoProgressDownDrag(_sp.videoControl.btn_mc.vol_mc.volume.volumSlide, 0,-13.5,0,-95+13.5);
					break;
				case "lightSlide":
					Parameter.getInstance().lightBool = true;
					_videoSeting.videoProgressDownDrag(_sp.light_mc.light.lightSlide, 0,-1,_sp.light_mc.light.width-_sp.light_mc.light.lightSlide.width,0);
					break;
				case "addSlide":
					Parameter.getInstance().videoAreaBool = true;
					_videoSeting.videoProgressDownDrag(_sp.addMC.addAreaProgress.addSlide, -7,-13.5,0,-(96-13.5));
					break;
				case "vid_mc":
					Parameter.getInstance().videoMoveBool = true;
					_sp.buttonMode = true;
					_sp.vid_mc.addEventListener(CustomEvent.VIDEO_STOPDRAG, mouseUpHandler);
					trace(Parameter.getInstance().scaleV);
					if (Parameter.getInstance().scaleV != 1)
					{
						e.currentTarget.startDrag();
					}
					_preDownTime = getTimer();
					TweenLite.killDelayedCallsTo(doClick);
					break;
			}
		}
		private function doClick():void 
		{
			//trace("click");
			_videoSeting.togglePauseVid();
		}
		
		private function mouseUpHandler(e:CustomEvent):void 
		{
			//trace("up")
			_sp.buttonMode = false;
			 _sp.vid_mc.removeEventListener(CustomEvent.VIDEO_STOPDRAG,mouseUpHandler);
			_videoSeting.videoProgressUpDrag(_sp.vid_mc);
            Parameter.getInstance().videoMoveBool = false;
            var now:int = getTimer();
            if((now - _preUpTime) < UP_INTER) {
               // trace("----double click");
				video_FullScreenHandler();
            } else if((now - _preDownTime) < UP_INTER) {
                TweenLite.delayedCall(0.2, doClick);
            } else {
               // trace("drag");
				TweenMax.to(_sp.vid_mc, .2, { x:Parameter.getInstance().mainX,y:Parameter.getInstance().mainY} );	
            }
            _preUpTime = now;
		}
		/**
		 * 视频播放记录控制面板
		 * @param	e
		 */
		private function recordProgressDownHandler(e:CustomEvent):void
		{
			switch(e.currentTarget.name)
			{
				case "kedu_mc":
					Parameter.getInstance().recordClickBlag = "true";
					_videoSeting.recordProgressDown(_sp.vidProgress.kedu_mc.recordProgresSlider,_sp.vidProgress.kedu_mc.kedubg);
					Parameter.getInstance().actionState = true;
					break;
				case"recordProgresSlider":
					Parameter.getInstance().recordBlag = "true";
					Parameter.getInstance().recordBool = true;
					_videoSeting.videoProgressDownDrag( _sp.vidProgress.kedu_mc.recordProgresSlider,-6.5,-14.5, _sp.vidProgress.kedu_mc.width-6.5,0);
					Parameter.getInstance().actionState = true;
					break;
			}
		}
		
		private function stageUpHandler(e:MouseEvent):void
		{
			_videoSeting.videoProgressUpDrag(e.currentTarget as MovieClip);
			Parameter.getInstance().videoAreaBool = false;
			Parameter.getInstance().lightBool = false;
			Parameter.getInstance().volumeBool = false;
			Parameter.getInstance().actionState = false;
			Parameter.getInstance().gsStatusBool = true;
			Parameter.getInstance().recordBool = false;
			if (Parameter.getInstance().recordBlag == "true")
			{
				Parameter.getInstance().gsStatusBool = false;
				Parameter.getInstance().recordBlag = "false"
				_videoSeting.videoRecordTime(Parameter.getInstance().recordX);
			}
			if (Parameter.getInstance().recordClickBlag == "true")
			{
				Parameter.getInstance().gsStatusBool = false;
				Parameter.getInstance().recordClickBlag = "false"
				_videoSeting.videoRecordTime(Parameter.getInstance().recordX);
			}
		}
	
		
		//视频全屏控制
		private function video_FullScreenHandler(e:CustomEvent=null):void
		{
			if (Parameter.getInstance().screenBool)
			{
				_videoSeting.normal();
			}
			else
			{
				_videoSeting.fullScreen();
				Parameter.getInstance().main.stage.addEventListener(Event.FULLSCREEN, fullStageScreenHandler);//--->ESC快捷键退出事件机制
			}
		}
		private function videoModeClickHandler(e:CustomEvent):void
		{
			_videoSeting.videoMode();
		}
		private function fullStageScreenHandler(e:Event):void
		{
			_videoSeting.videoNormal();
			Parameter.getInstance().main.removeEventListener(Event.FULLSCREEN, fullStageScreenHandler);
		}
	}

}