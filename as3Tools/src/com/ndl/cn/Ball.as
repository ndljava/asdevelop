package com.ndl.cn
{
	import mx.core.UIComponent;
	
	public class Ball extends UIComponent
	{
		
		public var m:int=5;
		public var u:Number=.3;
		
		public function Ball()
		{
			super();
			this.init();
		}
		
		private function init():void{
			
			this.graphics.beginFill(0xff0000);
			this.graphics.drawCircle(0,0,20);
			this.graphics.endFill();
		}
		
		
	}
}