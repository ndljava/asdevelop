package com.cn.Projectile {

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	import graphic.Ball;

	public class ProjectileTest extends Sprite {

		private var startBall:Ball;
		private var targetBall:Ball;

		public function ProjectileTest() {
			super();
			this.init();
		}

		private function init():void {

			this.startBall=new Ball();
			this.addChild(this.startBall);

			this.startBall.x=stage.stageWidth / 2;
			this.startBall.y=stage.stageHeight;

			this.targetBall=new Ball();
			this.addChild(this.targetBall);

			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void {

//			this.startBall.x+=(this.targetBall.x - this.startBall.x) * 0.2;
//			this.startBall.y+=(this.targetBall.y - this.startBall.y) * 0.2;

//			var p:Point=getVelcterPosition(new Point(this.startBall.x, this.startBall.y), new Point(this.targetBall.x, this.targetBall.y));
//
//			trace(p);
//
//			this.startBall.x+=p.x * 0.2;
//			this.startBall.y+=p.y * 0.2;

			this.startBall.x+=0.5 * 10;
			this.startBall.y+=0.5 * 10;

		}

		private function onClick(e:MouseEvent):void {

			this.targetBall.x=e.localX;
			this.targetBall.y=e.localY;

			this.startBall.x=stage.stageWidth / 2;
			this.startBall.y=stage.stageHeight;

		}

		private function getVelcterPosition(from:Point, to:Point):Point {
			var dx:Number=to.x - from.x;
			var dy:Number=to.y - from.y;

			if (dy >= 0)
				return new Point();

			var delta:Number=1 / stage.frameRate;
			var aG:Number=delta * delta * 9.8;

			var a:Number=0.5 / aG;
			var b:Number=0.5;
			var c:Number=dy;

			var p1:Number=(-b - Math.sqrt(b * b - 4 * a * c)) / (2 * a);
			var p2:Number=(-b + Math.sqrt(b * b - 4 * a * c)) / (2 * a);

			var vy:Number=p1;
			if (vy > 0)
				vy=p2;

			var vx:Number=dx / (-vy / (aG * delta));

			return new Point(vx, vy / stage.frameRate);
		}




	}
}
