package graphic {
	import mx.core.UIComponent;

	public class Line extends UIComponent {

		private var r:Number=300;

		public function Line(r:Number=300) {
			super();
			this.r=r;
			this.init();
		}

		private function init():void {

			this.graphics.lineStyle(0);
			this.graphics.moveTo(0, 0);
			this.graphics.lineTo(r, 0);
			this.graphics.endFill();
		}


	}
}
