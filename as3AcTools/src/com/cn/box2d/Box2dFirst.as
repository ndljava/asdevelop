package com.cn.box2d {

	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Joints.b2MouseJoint;
	import Box2D.Dynamics.Joints.b2MouseJointDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import graphic.Ball;

	public class Box2dFirst extends Sprite {

		private var world:b2World;
		private var body:b2Body;
		private var isDrag:Boolean=false;
		private var mouseJoint:b2MouseJoint;

		private var count:int=0;

		public function Box2dFirst() {
			super();
			this.init();
		}

		private function init():void {

			this.createWorld();
			this.createDebug();
			this.createGround();
			this.createBody(stage.stageWidth / 2, 0);

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);

		}

		private function onKeyUp(e:KeyboardEvent):void {

			switch (e.keyCode) {
				case Keyboard.LEFT:
					body.ApplyForce(new b2Vec2(0, 20000), body.GetWorldCenter());
//					body.ApplyImpulse(new b2Vec2(0, 200), body.GetWorldCenter());
					break;
				case Keyboard.RIGHT:
					body.ApplyForce(new b2Vec2(0, 20000), body.GetWorldCenter());
//					body.ApplyImpulse(new b2Vec2(0,200), body.GetWorldCenter());
					break;
			}

		}

		private function onMouseUp(e:MouseEvent):void {

			if (this.isDrag) {

				this.isDrag=false;
				if (mouseJoint != null) {
					world.DestroyJoint(mouseJoint);
					mouseJoint=null;
				}
			}


		}
		
//		private function getGoundAsBody():b2Body{
//			
//			
//			
//		}

		private function onMouseDown(e:MouseEvent):void {
//			createBody(mouseX, mouseY);

//			body.SetPosition(new b2Vec2(mouseX / 30, mouseY / 30));


//			body.SetLinearVelocity(new b2Vec2(0, 0));
//			body.SetLinearVelocity(new b2Vec2(0, 80));

			this.isDrag=true;

			var mouseJoindef:b2MouseJointDef=new b2MouseJointDef();

			mouseJoindef.bodyA=world.GetGroundBody();
			mouseJoindef.bodyB=body;

			mouseJoindef.target.Set(mouseX / 30, mouseY / 30);
			mouseJoindef.maxForce=1000;

			mouseJoint=world.CreateJoint(mouseJoindef) as b2MouseJoint;

		}

		private function onEnterFrame(e:Event):void {
			world.Step(1 / 30, 10, 10);

			if(mouseJoint!=null){
				mouseJoint.SetTarget(new b2Vec2(mouseX/30,mouseY/30));
				
			}
			
			for (var body:b2Body=world.GetBodyList(); body; body=body.GetNext()) {
				if (body.GetUserData() != null) {
					body.GetUserData().x=body.GetPosition().x * 30;
					body.GetUserData().y=body.GetPosition().y * 30;
					body.GetUserData().rotation=body.GetAngle() * 180 / Math.PI;
				}
			}

			world.ClearForces();
			world.DrawDebugData();
		}

		private function createWorld():void {
			var gravity:b2Vec2=new b2Vec2(0, 10);
			var doSleep:Boolean=true;
			world=new b2World(gravity, doSleep);

		}

		private function createDebug():void {

			var debugSprite:Sprite=new Sprite();
			this.addChild(debugSprite);

			var debugDraw:b2DebugDraw=new b2DebugDraw();
			debugDraw.SetSprite(debugSprite);
			debugDraw.SetDrawScale(30);
			debugDraw.SetFillAlpha(0.5);
			debugDraw.SetLineThickness(1.0);
			debugDraw.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit);

			world.SetDebugDraw(debugDraw);
		}

		private function createBody(posX:Number, posY:Number):void {

//			if (count > 5)
//				return;

//			var polygonShape:b2CircleShape=new b2CircleShape(20);

			var shapeRequest:b2FixtureDef=new b2FixtureDef();
			shapeRequest.density=3;
			shapeRequest.friction=0.3;
			shapeRequest.restitution=0.2;
			shapeRequest.shape=b2PolygonShape.AsBox(15 / 30, 15 / 30);
//			shapeRequest.shape=b2PolygonShape.AsOrientedBox(15 / 30, 15 / 30, new b2Vec2(0, 0), 40 * Math.PI / 180);
//			shapeRequest.shape=b2PolygonShape.AsOrientedBox(1,1, new b2Vec2(0.5, 0.5), 40 * Math.PI / 180);

//			shapeRequest.shape=new b2CircleShape(Math.random());

			var bodyRequest:b2BodyDef=new b2BodyDef();
			bodyRequest.type=b2Body.b2_dynamicBody;
			bodyRequest.position.Set(posX / 30, posY / 30);

			bodyRequest.userData=new Ball();
//			this.addChild(bodyRequest.userData);

			body=world.CreateBody(bodyRequest);
			body.CreateFixture(shapeRequest);

			shapeRequest.shape=b2PolygonShape.AsOrientedBox(15 / 30, 15 / 30, new b2Vec2(0, 1)); //, 40 * Math.PI / 180);
			body.CreateFixture(shapeRequest);
			shapeRequest.shape=b2PolygonShape.AsOrientedBox(15 / 30, 15 / 30, new b2Vec2(1, 1)); //, 40 * Math.PI / 180);
			body.CreateFixture(shapeRequest);




//			count++;
		}


		private function createGround():void {

			var shapeRequest:b2FixtureDef=new b2FixtureDef();
			shapeRequest.density=0;
			shapeRequest.friction=0.3;
			shapeRequest.restitution=0.2;
			shapeRequest.shape=b2PolygonShape.AsBox(stage.stageWidth / 30, 0.5 / 30);

			//1.创建刚体需求b2BodyDef
			var bodyRequest:b2BodyDef=new b2BodyDef();
			bodyRequest.type=b2Body.b2_staticBody;
			bodyRequest.position.Set(stage.stageWidth / 2 / 30, stage.stageHeight / 30); //记得米和像素的转换关系
			//2.Box2D世界工厂更具需求创建createBody()生产刚体
			body=world.CreateBody(bodyRequest);

			body.CreateFixture(shapeRequest);
		}


	}
}
