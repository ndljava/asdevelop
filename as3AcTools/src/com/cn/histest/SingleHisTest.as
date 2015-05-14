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

			this.ball1.vx=2;
			this.ball1.vy=2;

			this.ball1.mass=3.2;

			this.ball2=new Ball();
			this.addChild(this.ball2);

			this.ball2.x=this.stage.stageWidth / 2 + 100;
			this.ball2.y=this.stage.stageHeight / 2;

			this.ball2.vx=5;
			this.ball2.vy=5;

			this.ball2.mass=3.7;

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void {

			this.ball1.x+=this.ball1.vx;
			this.ball2.x+=this.ball2.vx;

			this.ball1.y+=this.ball1.vy;
			this.ball2.y+=this.ball2.vy;

			var dict:Number=this.ball2.x - this.ball1.x;
			
			if (dict <= this.ball1.radius * 2) {

				var vx1:Number=(this.ball1.mass - this.ball2.mass) * this.ball1.vx + 2 * this.ball2.mass * this.ball2.vx / (this.ball1.mass + this.ball2.mass);
				var vx2:Number=(this.ball2.mass - this.ball1.mass) * this.ball2.vx + 2 * this.ball1.mass * this.ball1.vx / (this.ball1.mass + this.ball2.mass);

				var vy1:Number=this.getShouheng(ball1.mass, ball1.vy, ball2.mass, ball2.vy);
				var vy2:Number=this.getShouheng(ball2.mass, ball2.vy, ball1.mass, ball1.vy);

				this.ball1.vx=vx1;
				this.ball2.vx=vx2;

				this.ball1.vy=vy1;
				this.ball2.vy=vy2;

//				this.ball1.x+=this.ball1.vx;
//				this.ball2.x+=this.ball2.vx;

//				this.ball1.y+=this.ball1.vy;
//				this.ball2.y+=this.ball2.vy;

				trace(vx1, vx2)

			}

			this.move(ball1);
			this.move(ball2);
		}

		private function move(ball:Ball):void {

			if (ball.x + 30 > stage.stageWidth) {
				ball.vx*=-1;
			} else if (ball.x - 30 <= 0) {
				ball.vx*=-1;
			}

			if (ball.y + 30 > stage.stageHeight) {
				ball.vy*=-1;
			} else if (ball.y - 30 <= 0) {
				ball.vy*=-1;
			}

		}

		private function getShouheng(m1:Number, v1:Number, m2:Number, v2:Number):Number {
			return ((m1 - m2) * v1 + 2 * m2 * v2) / m1 + m2;
		}




	}
}
