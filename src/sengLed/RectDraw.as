package sengLed 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class RectDraw extends Sprite 
	{
		
		public function RectDraw(w:Number,h:Number) 
		{
			//super();
			this.graphics.clear();
			this.graphics.beginFill(0xff6600, .4);
			this.graphics.drawRect(0, 0, w, h);
			this.graphics.endFill();
		}
		
	}

}