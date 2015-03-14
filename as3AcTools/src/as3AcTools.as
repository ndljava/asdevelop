package
{
	import flash.display.Sprite;
	
	import graphic.ArcG;
	import graphic.enum.ArcEnum;
	
	public class as3AcTools extends Sprite
	{
		public function as3AcTools()
		{
			trace("hello ndljava")
			this.addChild(new ArcG(ArcEnum.TYPE_LEFT));
			this.addChild(new ArcG(ArcEnum.TYPE_MIDD));
			this.addChild(new ArcG(ArcEnum.TYPE_RIGHT));
		}
	}
}