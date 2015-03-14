package graphic {
	import flash.display.Sprite;

	public class Fk extends Sprite {
		public function Fk() {
			super();
			this.init();
		}

		private function init():void {
			this.graphics.beginFill(0xff0000);
			this.graphics.drawRect(0,0, 40, 80);
			this.graphics.endFill();
		}


	}
}
