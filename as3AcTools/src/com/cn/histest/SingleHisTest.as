package com.cn.histest {

	import flash.display.Sprite;
	import flash.events.Event;

	import graphic.Ball;

	[SWF(width="600", height="500")]
	public class SingleHisTest extends Sprite {

		private var ball1:Ball;
		private var ball2:Ball;

		public function SingleHisTest() {
			super();
			this.init();
		}

		private function init():void {

			this.ball1=new Ball();
			this.addChild(this.ball1);

			this.ball1.x=this.stage.stageWidth / 2 - 100;
			this.ball1.y=this.stage.stageHeight / 2;

			this.ball1.vx=5;
			this.ball1.vy=5;

			this.ball1.mass=3;

			this.ball2=new Ball();
			this.addChild(this.ball2);

			this.ball2.x=this.stage.stageWidth / 2 + 100;
			this.ball2.y=this.stage.stageHeight / 2;

			this.ball2.vx=-5;
			this.ball2.vy=-5;

			this.ball2.mass=2;

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void {

			this.ball1.x+=this.ball1.vx;
			this.ball2.x+=this.ball2.vx;

			var dict:Number=this.ball2.x - this.ball1.x;
			if (dict <= this.ball1.radius) {

				var vx1:Number=(this.ball1.mass - this.ball2.mass) * this.ball1.vx + 2 * this.ball2.mass * this.ball2.vx / (this.ball1.mass + this.ball2.mass);
				var vx2:Number=(this.ball2.mass - this.ball1.mass) * this.ball2.vx + 2 * this.ball1.mass * this.ball1.vx / (this.ball1.mass + this.ball2.mass);

				this.ball1.vx=vx1;
				this.ball2.vx=vx2;

				trace(vx1, vx2)

			}
 
		}


		



	}
}
