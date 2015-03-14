package graphic
{
	import flash.display.Sprite;
	
	public class Line extends Sprite
	{
		public function Line()
		{
			super();
			this.init();
		}
		
		private function init():void{
			
			this.graphics.lineStyle(0);
			this.graphics.moveTo(0,0);
			this.graphics.lineTo(300,0);
			this.graphics.endFill();
		}
		
		
	}
}