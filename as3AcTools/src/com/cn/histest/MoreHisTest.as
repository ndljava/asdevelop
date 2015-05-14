package com.cn.histest {

	import flash.display.Sprite;
	import flash.events.Event;

	import graphic.Ball;

	public class MoreHisTest extends Sprite {

		private var balls:Array;

		public function MoreHisTest() {
			super();
			this.init();
		}

		private function init():void {

			var ball:Ball;
			this.balls=[];

			for (var i:int=0; i < 10; i++) {
				ball=new Ball();
				this.addChild(ball);

				ball.vx=Math.random() * 6;
				ball.vy=Math.random() * 6;

				ball.x=i * 6;
//				ball.y=Math.random() * 6;

//				ball.mass=Math.random() * 3;
				ball.mass=3;

//				trace(ball.x, ball.y, ball.vx, ball.vy);

				this.balls.push(ball);

			}

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}


		private function onEnterFrame(e:Event):void {

			var dist:Number=0;
			var ball1:Ball;
			var ball2:Ball;

			for (var i:int=0; i < this.balls.length; i++) {
				ball1=this.balls[i] as Ball;

				ball1.x+=ball1.vx;
				ball1.y+=ball1.vy;

				trace(ball1.x, ball1.y, ball1.vx, ball1.vy);

				for (var j:int=0; j < this.balls.length; j++) {
					ball2=this.balls[j] as Ball;

					dist=Math.sqrt(Math.pow(ball1.x - ball2.x, 2) + Math.pow(ball1.y - ball2.y, 2));

					if (dist <= ball1.radius * 2) {

						var vx1:Number=this.getShouheng(ball1.mass, ball1.vx, ball2.mass, ball2.vx);
						var vy1:Number=this.getShouheng(ball1.mass, ball1.vy, ball2.mass, ball2.vy);

						var vx2:Number=this.getShouheng(ball2.mass, ball2.vx, ball1.mass, ball1.vx);
						var vy2:Number=this.getShouheng(ball2.mass, ball2.vy, ball1.mass, ball1.vy);

						ball1.vx=vx1;
						ball1.vy=vy1;

						ball2.vx=vx2;
						ball2.vy=vy2;

						this.move(ball2);
						trace(vx1, vy1, vx2, vy2);
					}

				}

				this.move(ball1);
			}

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
