package {


	import flash.display.Sprite;
	import flash.events.Event;
	
	import graphic.Ball;

	[SWF(width="800", height="600")]
	public class Hist extends Sprite {

		private var ball:Ball;

		private var ballArr:Array=[];
		
		public function Hist() {
			super();
			this.init();
		}

		private function init():void {

			for (var i:int=0; i < 10000; i++) {
				var ball:Ball=new Ball(2);
				this.addChild(ball);

				ball.vx=Math.random() * 20;
				ball.vy=Math.random() * 20;

				ball.x=50+Math.random() * 200;
				ball.y=50+Math.random() * 200;
				
				this.ballArr.push(ball);
			}

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void {

			var ball:Ball;
			
			for (var i:int=0; i < 10000; i++) {
				ball=this.ballArr[i];
				ball.x+=ball.vx;
				ball.y+=ball.vy;
				
				this.move(ball);
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


	}
}
