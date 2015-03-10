package com.ndl.cn
{
	import mx.core.UIComponent;
	
	public class Line extends UIComponent
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