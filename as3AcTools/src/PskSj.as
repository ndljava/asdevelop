package {

	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageScaleMode;

	import graphic.Fk;

	[SWF(width="1920", height="1080")]
	/**
	 * 帕斯卡三角和谢尔平斯基三角 
	 * @author Administrator
	 * 
	 */	
	public class PskSj extends Sprite {


		public function PskSj() {
			super();
			this.init();
		}

		private function init():void {

			stage.scaleMode=StageScaleMode.NO_SCALE;

			var fk:Fk;
			var carr:Array=[];

			for (var i:int=0; i < 32; i++) {

				carr[i]=[];

				for (var j:int=0; j <= i; j++) {

					if (j == 0 || i == 0 || i == 1 || j==i)
						carr[i][j]=1;
					else{
						carr[i][j]=(carr[i - 1][j - 1] + carr[i - 1][j]);
					}
					
					if (carr[i][j] % 2 == 0) {
						trace(carr[i][j]);
						fk=new Fk(0x00ff00);
					} else {
						fk=new Fk(0xff0000);
					}

					this.addChild(fk);

					fk.x=500 - i * 20 / 2 + 20 * j;
					fk.y=i * 20;
				}

			}

		}


	}
}
