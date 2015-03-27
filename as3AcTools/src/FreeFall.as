package {

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;

	import graphic.Ball;

	[SWF(width="900", height="800")]
	public class FreeFall extends Sprite {

		private var ball:Ball;
		private var vm:Number=0;
		private var h:Number=0;
		private var va:Number=5;

		private var t:Number=0;

		public function FreeFall() {
			super();
			this.init();
		}

		private function init():void {

			this.ball=new Ball();
			this.addChild(this.ball);

			this.ball.x=200;
			this.ball.y=200;
			this.ball.vy=10;

			this.t=0; //getTimer();

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void {

//			h*=0.9;

			this.ball.vy+=0.5 * (t);
			vm+=this.ball.vy; // * t;
			this.ball.y=vm; //this.ball.vy * t-vm;

			if (this.ball.y > 600) {

				this.ball.vy*=-0.7;
				vm=600;
//				t*=0.3;

//				this.ball.vy*=-0.7;
//				this.ball.y=600;

//				if (vm <= 0) {
//					vm=(t - vm) * -0.7;
//				} else {
//					vm*=-0.7;
//				}
//				h=0.5 * (t * t) / 2;
			}

			t++;

			return;

//			this.ball.vy+=va;
			
			this.ball.vy+=5;

			this.ball.y+=this.ball.vy;

			trace(this.ball.vy, va, this.ball.y)

			if (this.ball.y > 300) {
				this.ball.y=300;
//				this.ball.vy*=-0.7;
				this.ball.vy*=-1;
			}

			if (this.ball.y < 0) {
				this.ball.y=0;
				this.ball.vy*=-0.7;
			}

		}


	}
}
