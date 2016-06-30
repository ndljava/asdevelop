package com.action {

	public class Vector2D {

		private var _x:Number=0;
		private var _y:Number=0;

		public function Vector2D(x:Number=0, y:Number=0) {
			_x=x;
			_y=y;
		}

		public function zero():Vector2D {
			_x=0;
			_y=0;
			return this;
		}

		public function isZero():Boolean {
			return _x == 0 && _y == 0;
		}

		public function get angle():Number {
			return Math.atan2(_y, _x);
		}

		public function set angle(v:Number):void {
			var a:Number=length;
			_x=Math.cos(v) * a;
			_y=Math.sin(v) * a;
		}

		public function set length(v:Number):void {
			var a:Number=angle;
			_x=Math.cos(a) * v;
			_y=Math.sin(a) * v;
		}

		public function get lengthSQ():Number {
			return _x * _x + _y * _y;
		}

		public function get length():Number {
			return Math.sqrt(lengthSQ);
		}

		public function truncate(max:Number):Vector2D {
			length=Math.min(max, length);
			return this;
		}

		public function reverse():Vector2D {
			_x=-_x;
			_y=-_y;

			return this;
		}

		public function add(v2:Vector2D):Vector2D {
			return new Vector2D(_x + v2.x)
		}

		public function set x(v:Number):void {
			this._x=v;
		}

		public function get x():Number {
			return _x;
		}

		public function set y(v:Number):void {
			this._y=v;
		}

		public function get y():Number {
			return _y;
		}

		public function equals(v2:Vector2D):Boolean {
			return (v2.x == _x && v2.y == _y);
		}

		public function normalize():Vector2D {
			if (length == 0) {
				_x=0;
				return this;
			}

			var len:Number=length;
			_x/=len;
			_y/=len;

			return this;
		}

		public function isNormalize():Boolean {
			return (length == 1.0);
		}

		public function doProd(v2:Vector2D):Number {
			return _x * v2.x + _y * v2.y;
		}

		public function crossProd(v2:Vector2D):Number {
			return _x * v2.y - _y * v2.x;
		}

		

	}
}
