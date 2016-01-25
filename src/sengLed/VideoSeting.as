package sengLed 
{
	import adobe.utils.CustomActions;
	import com.greensock.TweenMax;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode
	import flash.external.ExternalInterface;
	import flash.geom.Rectangle;
	
	/**
	 * ...视频控制
	 * @author Jing.li
	 */
	
	public class VideoSeting extends Sprite 
	{
		public var date:Date;
		
		private var _rect:RectDraw;
		public function VideoSeting() 
		{
			
		}
		public function togglePauseVid():void
		{
			if (Parameter.getInstance().isPlayerBool)
			{
				Parameter.getInstance().main._vidPlay.Pause();
				Parameter.getInstance().main._vidColl.vidProgress.startBtn.visible = true;
				Parameter.getInstance().main._vidColl.vidProgress.stopBtn.visible = false;
				Parameter.getInstance().main._vidColl.stopBig_mc.visible = true;
			}else
			{
				Parameter.getInstance().main._vidPlay.resume();
				Parameter.getInstance().main._vidColl.vidProgress.startBtn.visible = false;
				Parameter.getInstance().main._vidColl.vidProgress.stopBtn.visible = true;
				Parameter.getInstance().main._vidColl.stopBig_mc.visible = false;
			}
		}
		/**
		 * 全屏
		 */
		public function fullScreen():void
		{
			Parameter.getInstance().main.stage.displayState = StageDisplayState.FULL_SCREEN;
			Parameter.getInstance().screenBool = true;
			Parameter.getInstance().scaleV = 1;
			Parameter.getInstance().main._vidColl.x = 0;
			Parameter.getInstance().main._vidColl.y = 0;
			
			Parameter.getInstance().main._vidColl.vid_mc.scaleX = 1;
			Parameter.getInstance().main._vidColl.vid_mc.scaleY = 1;
			Parameter.getInstance().videoControlWidth = Parameter.getInstance().main.stage.fullScreenWidth;
			videoSize(Parameter.getInstance().videoControlWidth, Parameter.getInstance().videoWidth, Parameter.getInstance().videoHeight);
			Parameter.getInstance().main._vidColl.Rotate_MC.x = Parameter.getInstance().main.stage.fullScreenWidth / 2 - Parameter.getInstance().main._vidColl.Rotate_MC.width / 2;
			Parameter.getInstance().main._vidColl.Rotate_MC.y = Parameter.getInstance().main.stage.fullScreenHeight / 2 - Parameter.getInstance().main._vidColl.Rotate_MC.height / 2;
			
			Parameter.getInstance().main._vidColl.vid_mc.x = Parameter.getInstance().main.stage.fullScreenWidth/2;
			Parameter.getInstance().main._vidColl.vid_mc.y = Parameter.getInstance().main.stage.fullScreenHeight/2;
			
			Parameter.getInstance().main._vidColl.head_mc.visible = false;
			Parameter.getInstance().main._vidColl.bgLine.visible = false;
			Parameter.getInstance().main._vidColl.videoControl.btn_mc.normalBtn.visible = true;
			Parameter.getInstance().main._vidColl.videoControl.btn_mc.fullBtn.visible = false;
			
			Parameter.getInstance().main._vidColl.logo_mc.x = (Parameter.getInstance().main.stage.fullScreenWidth - Parameter.getInstance().main._vidColl.logo_mc.width) - 10;
			Parameter.getInstance().progressWidth = Parameter.getInstance().main.stage.fullScreenWidth;
			Parameter.getInstance().main._vidColl.stopBig_mc.x = Parameter.getInstance().main.stage.fullScreenWidth / 2 - Parameter.getInstance().main._vidColl.stopBig_mc.width / 2;
			Parameter.getInstance().main._vidColl.stopBig_mc.y = Parameter.getInstance().main.stage.fullScreenHeight / 2 - Parameter.getInstance().main._vidColl.stopBig_mc.height / 2;
			
			Parameter.getInstance().main._vidColl.addMC.addAreaProgress.addSlide.x = -6.65;
			Parameter.getInstance().main._vidColl.addMC.addAreaProgress.addSlide.y = -13.25;
			Parameter.getInstance().main._vidColl.videoControl.videoPlayPregressbg.width = Parameter.getInstance().main.stage.fullScreenWidth;
			
			Parameter.getInstance().main._vidColl.videoControl.videoControl.width = Parameter.getInstance().main.stage.fullScreenWidth;
			Parameter.getInstance().main._vidColl.videoControl.y = (Parameter.getInstance().main.stage.fullScreenHeight - Parameter.getInstance().main._vidColl.videoControl.videoControl.height);
			Parameter.getInstance().main._vidColl.videoControl.x = 0;
		
			Parameter.getInstance().main._vidColl.videoControl.btn_mc.x = Parameter.getInstance().main.stage.fullScreenWidth - Parameter.getInstance().main._vidColl.videoControl.btn_mc.width-10;
			
			Parameter.getInstance().main._vidColl.vidProgress.visible = false;
			
			Parameter.getInstance().main._vidColl.videoControl.addChild(Parameter.getInstance().main._vidColl.light_mc);
			Parameter.getInstance().main._vidColl.light_mc.x = 12;
			Parameter.getInstance().main._vidColl.light_mc.y = 8;
			Parameter.getInstance().main._vidColl.light_mc.scaleX = Parameter.getInstance().main._vidColl.light_mc.scaleY = .8;

			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.width =  Parameter.getInstance().main.stage.fullScreenWidth;
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.height =  Parameter.getInstance().main.stage.fullScreenHeight;
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.x = Parameter.getInstance().main._vidColl.vid_mc.video.x;
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.y = Parameter.getInstance().main._vidColl.vid_mc.video.y;
			
			Parameter.getInstance().main._vidColl.bg.width = Parameter.getInstance().main.stage.fullScreenWidth;
			Parameter.getInstance().main._vidColl.bg.height = Parameter.getInstance().main.stage.fullScreenHeight;
			Parameter.getInstance().main._vidColl.bg.x = 0;
			Parameter.getInstance().main._vidColl.bg.y = 0;
			Parameter.getInstance().mainW = Parameter.getInstance().main._vidColl.vid_mc.width;
			Parameter.getInstance().mainH = Parameter.getInstance().main._vidColl.vid_mc.height;
			Parameter.getInstance().mainX = Parameter.getInstance().main._vidColl.vid_mc.x;
			Parameter.getInstance().mainY = Parameter.getInstance().main._vidColl.vid_mc.y;
			Parameter.getInstance().main._vidColl.error_mc.width = Parameter.getInstance().main.stage.fullScreenWidth;
			Parameter.getInstance().main._vidColl.error_mc.height = Parameter.getInstance().main.stage.fullScreenHeight;
		}
		/**
		 * 正常模式
		 */
		public function normal():void
		{
			Parameter.getInstance().main.stage.displayState = StageDisplayState.NORMAL;
			videoNormal();
		}
		public function videoNormal():void
		{
			Parameter.getInstance().screenBool = false;
			Parameter.getInstance().main._vidColl.logo_mc.x = 677.9;
			Parameter.getInstance().videoControlWidth = 780;
			Parameter.getInstance().progressWidth = 780;
			Parameter.getInstance().main._vidColl.x = 5;
			Parameter.getInstance().main._vidColl.y = 40;
			Parameter.getInstance().main._vidColl.videoControl.btn_mc.x =665.45;
	
			Parameter.getInstance().main._vidColl.videoControl.videoPlayPregressbg.width = 785;
			Parameter.getInstance().main._vidColl.videoControl.videoControl.width = 785;
			Parameter.getInstance().main._vidColl.videoControl.y = 420.2;
			Parameter.getInstance().main._vidColl.videoControl.x = 5;
			videoSize(Parameter.getInstance().videoControlWidth, Parameter.getInstance().videoWidth, Parameter.getInstance().videoHeight);
			
			Parameter.getInstance().mainW = 780;
			Parameter.getInstance().mainH = 450;
			Parameter.getInstance().mainX = 395.35;
			Parameter.getInstance().mainY = 230.05;
			
			Parameter.getInstance().main._vidColl.vid_mc.x = 395.35;
			Parameter.getInstance().main._vidColl.vid_mc.y = 230.05;

			Parameter.getInstance().main._vidColl.head_mc.visible = true;
			Parameter.getInstance().main._vidColl.bgLine.visible = true;
			Parameter.getInstance().main._vidColl.videoControl.btn_mc.normalBtn.visible = false;
			Parameter.getInstance().main._vidColl.videoControl.btn_mc.fullBtn.visible = true;
			
			Parameter.getInstance().main._vidColl.addChild(Parameter.getInstance().main._vidColl.light_mc);
			Parameter.getInstance().main._vidColl.light_mc.y = -38.15;
			Parameter.getInstance().main._vidColl.light_mc.x = 12;
			Parameter.getInstance().main._vidColl.light_mc.scaleX = Parameter.getInstance().main._vidColl.light_mc.scaleY = 1;
			Parameter.getInstance().main._vidColl.vidProgress.visible = true;
			
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.width =  780;
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.height =  450;
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.x =  -390;
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.y =  -225;
			Parameter.getInstance().main._vidColl.bg.width = 800;
			Parameter.getInstance().main._vidColl.bg.height = 576;
			Parameter.getInstance().main._vidColl.bg.x = -5;
			Parameter.getInstance().main._vidColl.bg.y = -49;
			Parameter.getInstance().main._vidColl.stopBig_mc.x = 372.30;
			Parameter.getInstance().main._vidColl.stopBig_mc.y = 200.35;
			Parameter.getInstance().main._vidColl.Rotate_MC.x = 395;
			Parameter.getInstance().main._vidColl.Rotate_MC.y = 230;
			Parameter.getInstance().main._vidColl.error_mc.width = 800;
			Parameter.getInstance().main._vidColl.error_mc.height = 450;

			//trace(Parameter.getInstance().videoWidth +":"+Parameter.getInstance().videoHeight);
		}
		
		public function videoSize(mcW:Number,vW:Number,vH:Number):void
		{
			var stageW:Number = mcW;
			var stageH:Number = 0;
			stageH = (vH * stageW) / vW;
			Parameter.getInstance().main._vidColl.vid_mc.video.width = stageW;
			Parameter.getInstance().main._vidColl.vid_mc.video.height = stageH;
			if (mcW != Parameter.getInstance().main.stage.fullScreenWidth)
			{
				Parameter.getInstance().videoWidthMin = stageW;
				Parameter.getInstance().videoHeightMin = stageH;
			}
			Parameter.getInstance().main._vidColl.vid_mc.video.x = (Parameter.getInstance().mainW / 2 - stageW / 2)-Parameter.getInstance().mainW / 2;
			Parameter.getInstance().main._vidColl.vid_mc.video.y = (Parameter.getInstance().mainH / 2 - stageH / 2)-Parameter.getInstance().mainH / 2;
		}
		public function videoControlIsShow(mc:MovieClip,h:Number):void
		{
			TweenMax.to(mc, .5, { alpha:h} );
		}
		/**
		 * 播放进度控制
		 * @param	recordPlayPregress 记录视频控件
		 * @param	videoPlayPregress 视频播放进度控件
		 */
		public function playPregressDown(mcProgressScrubber:MovieClip,recordProgresSlider:MovieClip,videoProgressbg:MovieClip,kedubg:MovieClip):void
		{
			Parameter.getInstance().actionState = true;
			Parameter.getInstance().gsStatusBool = false;
			if (Parameter.getInstance().screenBool == false)
			{
				mcProgressScrubber.width = mouseX - 9;
			}else
			{
				mcProgressScrubber.width = mouseX;
			}
			Parameter.getInstance().main._vidPlay.progress(mcProgressScrubber,recordProgresSlider,videoProgressbg,kedubg,Parameter.getInstance().actionState,Parameter.getInstance().videoMode);
		}
		
		
		//音量大小控制
		public function volumeProgress(mc:MovieClip):void
		{
			if (Parameter.getInstance().volBtnBool)
			{
				Parameter.getInstance().volBtnBool = false;
				mc.visible = false;
			}
			else
			{
				Parameter.getInstance().volBtnBool = true;
				mc.visible = true;
			}
		}
		private var clickSec:Number;//用户点击事件执行的时间点
		public function recordProgressDown(ProgressSlider:MovieClip,kedubg:MovieClip):void
		{
			ProgressSlider.x = mouseX -92;
			Parameter.getInstance().recordX = ProgressSlider.x;
		}
	
		//视频画面放大
		public function videoBig(mc:MovieClip):void
		{
			if (mc.y<-82.75)
			{
				return;
			}
			var n:Number = (96 - mc.y)/mc.height;
			Parameter.getInstance().scaleV += Parameter.getInstance().scaleV / n;
			Parameter.getInstance().main._vidColl.vid_mc.scaleX = Parameter.getInstance().scaleV;
			Parameter.getInstance().main._vidColl.vid_mc.scaleY = Parameter.getInstance().scaleV ;
			mc.y -= mc.height;
			if (mc.y < -82.75 )
			{
				mc.y = -96;
			}
		}
		//视频画面缩小
		public function videoSmall(mc:MovieClip):void
		{
			if (mc.y > -13.25)
			{
				return;
			}
			var n:Number = mc.y / mc.height;
			if (Parameter.getInstance().scaleV >1)
			{
				mc.y += mc.height;
				Parameter.getInstance().scaleV -= -(Parameter.getInstance().scaleV-1) / n;
				Parameter.getInstance().main._vidColl.vid_mc.scaleX = Parameter.getInstance().scaleV;
				Parameter.getInstance().main._vidColl.vid_mc.scaleY = Parameter.getInstance().scaleV ;
				if (mc.y > -13.25)
				{
					mc.y = -13.25;
				}
			}
		}
		//切换Video播放模式
		public function videoMode():void
		{
			if (Parameter.getInstance().videoMode=="live")
			{
				Parameter.getInstance().videoMode = "vod";
				videoStatus();
			}
			else if(Parameter.getInstance().videoMode=="vod")
			{
				Parameter.getInstance().videoMode = "live";
				videoStatus();
			}
		}
		/**
		 * 改变播放状态，释放当前播放视频资源
		 */
		private function videoStatus():void
		{
			videoPregress(true);
			if (Parameter.getInstance().isPlayerBool)
			{
				Parameter.getInstance().main._vidPlay.closeStream();
			}
		}
		public function videoProgressUpDrag(mc:MovieClip):void
		{
			mc.stopDrag();
		}
		public function videoProgressDownDrag(mc:MovieClip,x:Number,y:Number,w:Number,h:Number):void
		{
			
			mc.startDrag(false, new Rectangle(x, y, w, h));
			
		}
		public function videoRecordTime(num:Number):void
		{
			updateDate();
			clickSec = Parameter.getInstance().totalSec / Parameter.getInstance().main._vidColl.vidProgress.kedu_mc.kedubg.width * num;
			if (Parameter.getInstance().videoMode == "live")
			{
				if (Number(clickSec.toFixed(0)) >=Parameter.getInstance().currDateTime )
				{
					Parameter.getInstance().durNum = Parameter.getInstance().currDateTime;
				}
				else
				{
					Parameter.getInstance().durNum = clickSec;
				}
			}else
			{
				Parameter.getInstance().durNum = clickSec;
			}
			videoStatus();
			videoPlayName();
		}
		public function videoMoveAction(vidmc:MovieClip):void
		{
				var x1:Number = (vidmc.width - Parameter.getInstance().mainW) / 2 + Parameter.getInstance().mainX;
				var y1:Number = (vidmc.height - Parameter.getInstance().mainH) / 2 + Parameter.getInstance().mainY;
				var x2:Number =Parameter.getInstance().mainX-((vidmc.width - Parameter.getInstance().mainW) / 2);
				var y2:Number =Parameter.getInstance().mainY-((vidmc.height - Parameter.getInstance().mainH) / 2);
				
				if (vidmc.x >= x1)
				{
					vidmc.x = x1;
				}
				else if (vidmc.x <= x2)
				{
					vidmc.x = x2;
				}
				else if (vidmc.y >= y1)
				{
					vidmc.y = y1;
				}
				else if (vidmc.y <= y2)
				{
					vidmc.y = y2;
				}
		}
		public function volumeAction():void
		{
			var vol:Number = Math.abs(Parameter.getInstance().main._vidColl.videoControl.btn_mc.vol_mc.volume.volumSlide.y / ( Parameter.getInstance().main._vidColl.videoControl.btn_mc.vol_mc.volume.height - Parameter.getInstance().main._vidColl.videoControl.btn_mc.vol_mc.volume.volumSlide.height))-0.15;
			Parameter.getInstance().main._vidColl.videoControl.btn_mc.vol_mc.volume.volumeProgress.scaleY = vol;
			Parameter.getInstance().main._vidPlay.setVolume(vol);
		}
		public function videoAreaScale():void
		{
			Parameter.getInstance().scaleV =Math.abs(Parameter.getInstance().main._vidColl.addMC.addAreaProgress.addSlide.y / (Parameter.getInstance().main._vidColl.addMC.addAreaProgress.height-Parameter.getInstance().main._vidColl.addMC.addAreaProgress.addSlide.height))-0.15+1;
			Parameter.getInstance().main._vidColl.vid_mc.scaleX = Parameter.getInstance().main._vidColl.vid_mc.scaleY = Parameter.getInstance().scaleV;
		}
		public function lightAction():void
		{
			Parameter.getInstance().alphaV = Parameter.getInstance().main._vidColl.light_mc.light.lightSlide.x / Parameter.getInstance().main._vidColl.light_mc.light.lightBg.width;
			Parameter.getInstance().main._vidColl.light_mc.light.lightProgress.scaleX = Parameter.getInstance().alphaV;
			Parameter.getInstance().main._vidColl.vid_mc.alphaMC.alpha = 1 - (Parameter.getInstance().alphaV + 0.085);
			Parameter.getInstance().main._vidColl.light_mc.light_zhe.alpha = Parameter.getInstance().main._vidColl.vid_mc.alphaMC.alpha;
		}
		public function videoClear(str:String):void
		{
			Parameter.getInstance().main._vidColl.vidProgress.stopBtn.visible = true;
			Parameter.getInstance().main._vidColl.vidProgress.startBtn.visible = false;
			Parameter.getInstance().main._vidColl.stopBig_mc.visible = false;
			
			videoPregress(true);
			Parameter.getInstance().main._vidPlay.closeStream();
			Parameter.getInstance().main._vidColl.error_mc.visible = false;
			strJson(str);
			if (Global.obj.list.length > 0)
			{
				Parameter.getInstance().nextNum = 0;
				Parameter.getInstance().videoShift = Global.fromTimeArr[Parameter.getInstance().nextNum];
				Parameter.getInstance().main._vidPlay.Play(Global.obj.list[Parameter.getInstance().nextNum].playUrl);
			}
		}
		public function updateDate():void
		{
			date = null;
			date = new Date();
			Parameter.getInstance().currDateTime = (60 * 60 * (date.hours)) + (date.minutes * 60) + (date.seconds);
		}
		
		public function strJson(str:String):void
		{
			/*str ='{"list": ['
             +'{'
             +'"playUrl": "0.MP4",'
             +'"timezone": "GMT+08:00",'
             +'"timezoneCity": "Asia/Shanghai",'
             +'"bigImage": null,'
             +'"smallImage": null,'
             +'"videoTimeLength": null,'
             +'"from": "2015-10-26 23:59:01",'
             +'"to": "2015-10-27 00:02:25"'
			+'},' 
			+'{'
             +'"playUrl": "0.mp4",'
             +'"timezone": "GMT+08:00",'
             +'"timezoneCity": "Asia/Shanghai",'
             +'"bigImage": null,'
             +'"smallImage": null,'
             +'"videoTimeLength": null,'
             +'"from": "2015-10-27 05:45:01",'
             +'"to": "2015-10-27 05:48:25"'
			+'},'
			+'{'
             +'"playUrl": "0.MP4",'
             +'"timezone": "GMT+08:00",'
             +'"timezoneCity": "Asia/Shanghai",'
             +'"bigImage": null,'
             +'"smallImage": null,'
             +'"videoTimeLength": null,'
             +'"from": "2015-10-27 23:58:00",'
             +'"to": "2015-10-28 00:01:25"'
			+'}'
			+']}';*/
			//escape
			if (str == "" ||  str == null) return;
			Global.fromTimeArr = [];
			Global.toTimeArr = [];
			
			//Parameter.getInstance().main._vidColl.txt.text = str + "----";
			Global.obj =JSON.parse(str);
			var startTimeNum:Number = 0;
			var endTimeNum:Number = 0;
			Global.videoListLength = Global.obj.list.length;
			for (var i:int = 0; i < Global.videoListLength; i++ )
			{
				var startDate:String = String(Global.obj.list[i].from).substr(0, 10); trace(startDate);
				var endDate:String = String(Global.obj.list[i].to).substr(0,10);
				var startTime:String = String(Global.obj.list[i].from).substr(11);
				var endTime:String = String(Global.obj.list[i].to).substr(11);
				var startArr:Array = startTime.split(":");
				var endArr:Array = endTime.split(":");
				startTimeNum =  (60 * 60* Number(startArr[0]))+ (Number(startArr[1]) * 60) + Number(startArr[2]);
				endTimeNum = (60 * 60 * Number(endArr[0])) + (Number(endArr[1]) * 60) + Number(endArr[2]);
				Global.fromTimeArr.push(startTimeNum);
				Global.toTimeArr.push(endTimeNum);
				Global.fromDateArr.push(startDate);
				Global.toDateArr.push(endDate);
			}
			isPlayVid();
		}
		
		public function videoPlayName():void
		{
			//isPlayVid();
			for (var n:int = 0; n<Global.fromTimeArr.length; n++)
			{
				if (n < Global.fromTimeArr.length - 1)
				{
					if (Parameter.getInstance().durNum > Global.fromTimeArr[n] && Parameter.getInstance().durNum < Global.fromTimeArr[n+1] )
					{
						if (Parameter.getInstance().durNum < Global.toTimeArr[n])
						{
							Parameter.getInstance().continueTime =  Parameter.getInstance().durNum -Global.fromTimeArr[n];
							Parameter.getInstance().videoShift = Parameter.getInstance().durNum;
							Parameter.getInstance().main._vidPlay.Play(Global.obj.list[n].playUrl);
							Parameter.getInstance().nextNum = n;
						}
						else
						{
							Parameter.getInstance().continueTime = 0;
							progressStopShowError();
							//Parameter.getInstance().videoShift = Global.fromTimeArr[n];
							//Parameter.getInstance().main._vidPlay.Play(Global.obj.list[n].playUrl);
							//停止播放
						}
					}
					else if (Parameter.getInstance().durNum < Global.fromTimeArr[0] )
					{
						Parameter.getInstance().continueTime = 0;
						progressStopShowError();
						//Parameter.getInstance().videoShift = Global.fromTimeArr[0];
						//Parameter.getInstance().main._vidPlay.Play(Global.obj.list[0].playUrl);
						//停止播放
					}
					
				}
				else if(Parameter.getInstance().durNum > Global.fromTimeArr[Global.fromTimeArr.length-1] )
				{
					if (Parameter.getInstance().durNum < Global.toTimeArr[Global.toTimeArr.length-1])
					{
						Parameter.getInstance().continueTime =  Parameter.getInstance().durNum -Global.fromTimeArr[Global.toTimeArr.length - 1];
						Parameter.getInstance().videoShift = Parameter.getInstance().durNum;
						Parameter.getInstance().main._vidPlay.Play(Global.obj.list[Global.toTimeArr.length - 1].playUrl);
						Parameter.getInstance().nextNum = Global.fromTimeArr.length-1;
					}
					else
					{
						Parameter.getInstance().continueTime = 0;
						progressStopShowError();
						//Parameter.getInstance().videoShift = Global.fromTimeArr[Global.toTimeArr.length - 1];
						//Parameter.getInstance().main._vidPlay.Play(Global.obj.list[Global.toTimeArr.length-1].playUrl);
						//停止播放
					}
				}
			}
		}
		public function progressStopShowError():void
		{
			videoPregress(false);
			Parameter.getInstance().isPlayerBool = false;
			Parameter.getInstance().gsStatusBool = false;
			Parameter.getInstance().main._vidColl.error_mc.visible = true;
		}
		public function videoPregress(bool:Boolean):void
		{
			Parameter.getInstance().main._vidColl.Rotate_MC.visible = bool;
			if (bool)
			{
				Parameter.getInstance().main._vidColl.Rotate_MC.play();
			}
			else
			{
				Parameter.getInstance().main._vidColl.Rotate_MC.stop();
			}
		}
		//绘制可播放区域视频
		public function isPlayVid():void
		{
			clearDraw();
			for (var i:int = 0; i < Global.obj.list.length ; i++) 
			{
				var _x1:Number = Global.fromTimeArr[i] / Parameter.getInstance().totalSec  * Parameter.getInstance().main._vidColl.vidProgress.kedu_mc.kedubg.width;
				var _x2:Number = Global.toTimeArr[i] / Parameter.getInstance().totalSec  * Parameter.getInstance().main._vidColl.vidProgress.kedu_mc.kedubg.width;
				if (i == 0)
				{
					if (Global.fromDateArr[i] != Global.toDateArr[i])
					{
						_x1 = 0;
					}
				}
				if (i !=0)
				{
					if (i==Global.obj.list.length-1)
					{
						if (Global.fromDateArr[Global.obj.list.length - 1] != Global.toDateArr[Global.obj.list.length - 1])
						{
							_x1 = Global.fromTimeArr[Global.obj.list.length - 1] / Parameter.getInstance().totalSec  * Parameter.getInstance().main._vidColl.vidProgress.kedu_mc.kedubg.width;
							_x2 = Parameter.getInstance().totalSec  / Parameter.getInstance().totalSec  * Parameter.getInstance().main._vidColl.vidProgress.kedu_mc.kedubg.width;
						}
					}
				}
				var w:Number = _x2 - _x1;
				_rect= new RectDraw(w, 66);
				_rect.x = _x1;
				_rect.y = -15;
				Parameter.getInstance().main._vidColl.vidProgress.kedu_mc.kedubg.addChild(_rect);
				Global.arr.push(_rect);
			}	
		}
		private function clearDraw():void
		{
			for (var n:int = 0; n < Global.arr.length; n++)
			{
				Parameter.getInstance().main._vidColl.vidProgress.kedu_mc.kedubg.removeChild(Global.arr[n]);
			}
			Global.arr = [];
		}
	}

}