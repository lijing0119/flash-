package
{

	import com.greensock.TweenMax;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.system.Security;
	import flash.utils.setTimeout;
	import sengLed.Controller.VideoPlay;
	import sengLed.VideoEvent.ActionEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import sengLed.VideoSeting;
	
	/**
	 * 
	 * @author Jing.li
	 */
	public class Main extends Sprite
	{
		public var _vidColl:VideoMain;
		private var _btnArr:Array = [];
		public var _vidPlay:sengLed.Controller.VideoPlay;

		private var parms:String;
		private var _videoSeting:VideoSeting = new VideoSeting();
		public function Main()
		{
			if (stage) {
				Security.allowDomain("*");
				Security.allowInsecureDomain("*");
				initModule();
			}
		}
		
		private function init(str:String):void
		{
			_videoSeting.updateDate();
			_videoSeting.strJson(str);
			if(Parameter.getInstance().videoMode=="live"){
			Parameter.getInstance().durNum = Parameter.getInstance().currDateTime;}
			var ac:sengLed.VideoEvent.ActionEvent = new sengLed.VideoEvent.ActionEvent(_vidColl);
			var _red5:Red5 = new Red5();
			Parameter.getInstance().nc.client = this;
			if (!Parameter.getInstance().connected)
			{
				Parameter.getInstance().connected = true;
				Parameter.getInstance().nc.connect(null);
				addEventListener(Event.ENTER_FRAME, gs);
			}
			if (ExternalInterface.available) {
				ExternalInterface.addCallback("callAsFunction", videoList);//右侧视频列表
			}
		}
		
		/*private function sendData(str:String):void 
		{
			Parameter.getInstance().main._vidColl.Rotate_MC.play();
			Parameter.getInstance().main._vidColl.Rotate_MC.visible = true;
			_vidColl.error_mc.visible = false;
			Parameter.getInstance().playName = str;
			_vidPlay.Play(str);
		}*/
		
		private function videoList(videoName:String):void
		{
			_videoSeting.videoClear(videoName);
		}
		public function onBWDone():void{}
		public function gs(e:Event):void
		{
			if (Parameter.getInstance().recordBool)
			{
				Parameter.getInstance().recordX = _vidColl.vidProgress.kedu_mc.recordProgresSlider.x;
			}
			if (Parameter.getInstance().connected)
			{
				if (Parameter.getInstance().gsStatusBool)
				{
					Parameter.getInstance().main._vidPlay.progress(_vidColl.videoControl.videoPlayPregress, _vidColl.vidProgress.kedu_mc.recordProgresSlider,_vidColl.videoControl.videoPlayPregressbg,_vidColl.vidProgress.kedu_mc.kedubg,Parameter.getInstance().actionState, Parameter.getInstance().videoMode);
				}
			}
			if (Parameter.getInstance().lightBool)
			{
				_videoSeting.lightAction();
			}
			if (Parameter.getInstance().videoAreaBool)
			{
				_videoSeting.videoAreaScale();
			}
			if (Parameter.getInstance().volumeBool)
			{
				_videoSeting.volumeAction();
			}
			if (Parameter.getInstance().videoMoveBool)
			{
				_videoSeting.videoMoveAction(_vidColl.vid_mc);
			}
		}
		private function initModule():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT; 
			parms = stage.loaderInfo.parameters['url'];
			Parameter.getInstance().main = this;
			_vidColl = new VideoMain();
			_vidColl.name = "vidColl";
			_vidColl.x = 5;
			_vidColl.y = 40;
			_vidColl.alpha = 0;
			addChild(_vidColl);
			_vidColl.txt.visible = false;
			TweenMax.to(_vidColl, .5, { alpha:1} );
			_vidColl.videoControl.btn_mc.vol_mc.visible = false;
			_vidColl.videoControl.btn_mc.vol_mc.volume.volumeProgress.scaleY = .5;
			_vidColl.videoControl.videoPlayPregress.scaleX = 0;
			_vidColl.vid_mc.alphaMC.alpha = 0;
			_vidColl.light_mc.light_zhe.alpha = 0;
			_vidColl.videoControl.btn_mc.normalBtn.visible = false;
			_vidColl.vidProgress.startBtn.visible = false;
			_vidColl.vidProgress.stopBtn.visible = true;
			_vidColl.error_mc.visible = false;
			_vidColl.error_mc.RefreshBtn.buttonMode = true;
			_vidColl.stopBig_mc.visible = false;
			_vidColl.addMC.buttonMode = true;
			init(parms);
			//init("http://54.223.200.231:8000/amazon-storage/download?bucketName=sengledvideobucket&filename=7a225134-c37a-4cde-9f59-a9086f35a0f7.mp4");
		}
		
	}

}