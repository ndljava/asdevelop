package graphic {

	import flash.display.Sprite;

	public class ArcG extends Sprite {

		public var h:Number=0;
		public var w:Number=0;

		public var type:int=0;

		public function ArcG(type:int=0, w:Number=20, h:Number=30) {
			super();
			this.w=w;
			this.h=h;
			this.type=type;
			this.init();
		}

		private function init():void {

			this.graphics.lineStyle(0);
			this.graphics.lineTo(this.w, 0);

			switch (this.type) {
				case 0:
					this.graphics.lineTo(0, this.h);
					break;
				case 1:
					this.graphics.lineTo(this.w / 2, this.h);
					break;
				case 2:
					this.graphics.lineTo(this.w, this.h);
					break;
			}

			this.graphics.lineTo(0, 0);

		}


	}
}
