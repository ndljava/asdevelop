package {
	import flash.display.Sprite;

	public class Hannoi extends Sprite {

		private var count:int=0;

		public function Hannoi() {
			super();
			this.init();
		}

		private function init():void {

//			this.ActionHannoi(6, "A", "B", "C");

			for (var i:int=1; i < 20; i++) {
				trace(this.ActionBqn(i));
			}
		}

		/**
		 * 汉诺塔 
		 * @param i
		 * @param x
		 * @param y
		 * @param z
		 * 
		 */
		private function ActionHannoi(i:int, x:String, y:String, z:String):void {

			if (i == 0) {

			} else {
				ActionHannoi(i - 1, x, z, y);
				trace(x, "==>", y, ++count);
				ActionHannoi(i - 1, z, y, x);
			}
		}

		/**
		 *斐波那契 
		 * @param n
		 * @return 
		 * 
		 */		
		private function ActionBqn(n:int):int {

			var num:int=1;
			if (n < 3) {

			} else {
				num=ActionBqn(n - 1) + ActionBqn(n - 2);
			}

			return num;
		}

	}
}
