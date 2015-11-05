package graphic {
	import flash.display.Sprite;

	public class Fk extends Sprite {
		
		public var color:uint;
		
		public function Fk(c:uint=0xff0000) {
			super();
			this.color=c;
			this.init();
		}

		private function init():void {
			this.graphics.beginFill(color);
			this.graphics.drawRect(0,0, 20, 20);
			this.graphics.endFill();
		}


	}
}
