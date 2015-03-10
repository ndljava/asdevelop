package com.ndl.cn {
	import flash.display.Sprite;

	public class Ball extends Sprite {

		public var mass:int=5;
		public var u:Number=.3;

		public var vx:Number=0;
		public var vy:Number=0;

		public var radius:Number=0;

		public function Ball(r:Number=20) {
			super();
			this.radius=r;
			this.init();
		}

		private function init():void {

			this.graphics.beginFill(0xff0000);
			this.graphics.drawCircle(0, 0, radius);
			this.graphics.endFill();
		}


	}
}
