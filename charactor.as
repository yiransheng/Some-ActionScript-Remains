package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	
	public class charactor extends MovieClip {
		public var angle:Number;
		public var step:Number;
		public var destx:Number;
		public var desty:Number;
		public function charactor(px:Number,py:Number){
			this.step=0;
			this.angle=0;
			this.destx=px;
			this.desty=py;
			this.x=px;
			this.y=py;
			}
		public function update(xx,yy){
				this.x=xx;
				this.y=yy;
				wzgfacing(angle);
			}
		//function wzgfacing is not finished yet
		public function wzgfacing(a){
			this.gotoAndStop(2);
			}
		public function stand(){
			destx=this.x;
			desty=this.y;
			step=0;
			this.gotoAndStop(1);
			}
		}
}
	
