package sengLed.Controller 
{
	import adobe.utils.CustomActions;
	import flash.display.MovieClip;
	import flash.events.ActivityEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.media.Microphone;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.NetStream;
	import sengLed.RectDraw;
	import sengLed.VideoSeting;
	/**
	 * ...
	 * @author Jing.li
	 */
	public class VideoPlay 
	{
		private var _data:Date;
		private var _mic:Microphone;
		private var _obj:Object = new Object();
		private var channel:SoundChannel = new SoundChannel();
		private var _videoSeting:VideoSeting = new VideoSeting();
		public function VideoPlay() 
		{
			trace("****************VideoPlay****************");
			Parameter.getInstance().ns = new NetStream(Parameter.getInstance().nc);
			Parameter.getInstance().ns.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			Parameter.getInstance().ns.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			Parameter.getInstance().main._vidColl.vid_mc.video.attachNetStream(Parameter.getInstance().ns);
			Parameter.getInstance().main._vidColl.vid_mc.video.smoothing = true;
			_obj.onMetaData = onMetaData;
			_obj.onPlayStatus = onPlayStatus;
			Parameter.getInstance().ns.client = _obj;
			_mic = Microphone.getMicrophone();
		}
		
		private function errorHandler(e:IOErrorEvent):void 
		{
		
		}
		//语音
		public function say(sayStr:String):void
		{
			if (_mic != null) { 
				_mic.setUseEchoSuppression(true);
				_mic.gain = 80;
				_mic.setSilenceLevel(0);
				_mic.rate = 44;
				Parameter.getInstance().ns.attachAudio(_mic);
				_mic.addEventListener(ActivityEvent.ACTIVITY, activityHandler);
				Parameter.getInstance().ns.bufferTime = 1;
				Parameter.getInstance().ns.publish(sayStr, "Record");
			}	
		}
		private function activityHandler(e:ActivityEvent):void
		{}
		//音量控制
		public function setVolume(intVolume:Number = 0):void
		{
			var sndTransform:SoundTransform = new SoundTransform(intVolume);
			Parameter.getInstance().ns.soundTransform = sndTransform;
		}
		//关闭流并释放所有资源
		public function closeStream():void
		{
			Parameter.getInstance().isPlayerBool = false;
			Parameter.getInstance().gsStatusBool = false;
			Parameter.getInstance().ns.close();
			Parameter.getInstance().ns.dispose();
			Parameter.getInstance().main._vidColl.vid_mc.video.clear();
			Parameter.getInstance().ns.seek(0);
			//Parameter.getInstance().ns.time = 0;
		}
		public function Play(str:String):void
		{
			if (!Parameter.getInstance().isPlayerBool)
			{
				trace("开始播放");
				Parameter.getInstance().ns.bufferTime = 1;
				Parameter.getInstance().isPlayerBool = true;
				Parameter.getInstance().gsStatusBool = true;
				Parameter.getInstance().main._vidColl.error_mc.visible = false;
				Parameter.getInstance().ns.play(str);
			}
		}
		public function resume():void
		{
			if (!Parameter.getInstance().isPlayerBool)
			{
				trace("恢复播放");
				Parameter.getInstance().isPlayerBool = true;
				Parameter.getInstance().gsStatusBool = true;
				Parameter.getInstance().ns.resume();
			}
		}
		
		//暂停
		public function Pause():void
		{
			trace("暂停");
			Parameter.getInstance().ns.pause();
			Parameter.getInstance().isPlayerBool = false;
			Parameter.getInstance().gsStatusBool = false;
		}
		
		private function netStatusHandler(e:NetStatusEvent):void
		{
			trace(e.info.code);
			switch(e.info.code)
			{
				case "NetStream.Play.Start":
					break;
				case "NetStream.Buffer.Full":	
					_videoSeting.videoPregress(false);
					break;
				case "NetStream.Buffer.Empty":
					_videoSeting.videoPregress(true);
					break;
				case "NetStream.Play.StreamNotFound":
					_videoSeting.progressStopShowError();
					break;
				case "NetStream.Play.Failed":
					_videoSeting.progressStopShowError();
					break;
				case "NetStream.Play.Reset":
					break;
				case "NetStream.Connect.Closed":
					break;
				case "NetStream.SeekStart.Notify":
					_videoSeting.videoPregress(true);
					break;
			}
		}
		private var t:Number;//视频播放持续的秒数
		private var dur:Number;
		public function progress(mcProgressScrubber:MovieClip,recordProgresSlider:MovieClip,videoProgressbg:MovieClip,kedubg:MovieClip,actionState:Boolean,vidMode:String):void
		{
			t = Parameter.getInstance().ns.time;
			dur = _obj.duration-Global.playTimeNum;
			if (actionState)
			{
				Parameter.getInstance().ns.seek(mcProgressScrubber.width * dur  / videoProgressbg.width);
				t = mcProgressScrubber.width * dur  / videoProgressbg.width; 
			}
			else
			{
				mcProgressScrubber.width = t / dur  * videoProgressbg.width;
				recordProgresSlider.x = (((t + Parameter.getInstance().videoShift) / Parameter.getInstance().totalSec  * kedubg.width)-recordProgresSlider.width/2)+7;
			}
			if (Parameter.getInstance().nextNum == Global.obj.list.length - 1)
			{
				if (t >=dur){
					closeStream();
				}
			}
		}

		private function onMetaData(info:Object):void
		{
			_obj = info;
			Parameter.getInstance().ns.seek(Parameter.getInstance().continueTime);
			trace("metadata: duration=" + info.duration + " width=" + info.width + " height=" + info.height + " framerate=" + info.framerate);
			Parameter.getInstance().videoWidth = info.width;
			Parameter.getInstance().videoHeight = info.height;
			_videoSeting.videoSize(Parameter.getInstance().videoControlWidth,Parameter.getInstance().videoWidth,Parameter.getInstance().videoHeight);
		}
		private function onPlayStatus(info:Object):void {
			switch(info.code)
			{
				case "NetStream.Play.Complete":
					trace('播放完成');
					Parameter.getInstance().nextNum += 1;
					if (Parameter.getInstance().nextNum < Global.videoListLength)
					{
						Parameter.getInstance().main._vidPlay.closeStream();
						_videoSeting.videoPregress(true);
						nextVideo();
					}
				break;
			}
		}
		public function nextVideo():void
		{
			//trace("****************************"+(_obj.duration-Global.playTimeNum));
			Parameter.getInstance().continueTime = 0;
			Global.playTimeNum = 0;
			if (Parameter.getInstance().nextNum == 0)
			{
				if (Global.fromDateArr[Parameter.getInstance().nextNum] != Global.toDateArr[Parameter.getInstance().nextNum])
				{
					Parameter.getInstance().continueTime = Parameter.getInstance().totalSec - Global.fromTimeArr[0] ;//0
					Parameter.getInstance().videoShift = 0;
				}
			}
			else if (Parameter.getInstance().nextNum != 0)
			{
				if (Parameter.getInstance().nextNum == Global.obj.list.length - 1)
				{
					if (Global.fromDateArr[Global.obj.list.length - 1] != Global.toDateArr[Global.obj.list.length - 1])
					{
						Global.playTimeNum =Global.toTimeArr[Global.obj.list.length - 1];
						Parameter.getInstance().continueTime = 0;
						Parameter.getInstance().videoShift = Global.fromTimeArr[Parameter.getInstance().nextNum];
					}
				}
			}
			else
			{
				Parameter.getInstance().videoShift = Global.fromTimeArr[Parameter.getInstance().nextNum];
			}
			
			Parameter.getInstance().main._vidPlay.Play(Global.obj.list[Parameter.getInstance().nextNum].playUrl);
		}
	}

}