package com.action {

	public class SteeredVehicle extends Vehicle {
		
		private var _maxForce:Number=1; //最大转向力
		private var _steeringForce:Vector2D; //转向速度

		public function SteeredVehicle() {
			_steeringForce=new Vector2D();
			super();
		}

		public function set maxForce(value:Number):void {
			_maxForce=value;
		}

		public function get maxForce():Number {
			return _maxForce;
		}

		override public function update():void {
			_steeringForce.truncate(_maxForce); //限制为最大转向速度，以避免出现突然的大转身
			_steeringForce=_steeringForce.divide(_mass); //惯性的体现
			_velocity=_velocity.add(_steeringForce);
			_steeringForce=new Vector2D();
			super.update();
		}
		
		//寻找(Seek)行为
		public function seek(target: Vector2D):void {
			var desiredVelocity:Vector2D=target.subtract(_position);
			desiredVelocity.normalize();
			desiredVelocity=desiredVelocity.multiply(_maxSpeed);//注：这里的_maxSpeed是从父类继承得来的
			var force:Vector2D=desiredVelocity.subtract(_velocity);
			_steeringForce=_steeringForce.add(force);
		}
		
	}
}
