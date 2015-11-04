package {
	import com.action.SteeredVehicle;
	import com.action.Vector2D;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	public class SeekTest extends Sprite {
		
		private var _vehicle:SteeredVehicle;

		public function SeekTest() {
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			_vehicle=new SteeredVehicle();
			addChild(_vehicle);
			//addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			for(var i:int=1;i<1000000000;i*=10){
				trace(i)
			}
			 
			trace(Math.pow(1234567,987654321));
			
		}

		private function onEnterFrame(event:Event):void {
			_vehicle.seek(new Vector2D(mouseX, mouseY)); //以当前鼠标位置为目标点
			_vehicle.update();
		}
	}
}
