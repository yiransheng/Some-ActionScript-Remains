package{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class npcCat extends MovieClip{
		//varable description:npcState monitors the animation of this movieclip play on stage
		public var npcState:String;
		//varable description:if charactorNear=true, than initiate interactions else do nothing
		public var charactorNear:Boolean;
		public function npcCat(px,py,myState){
			this.x=px;
			this.y=py;
			this.npcState=myState;
			this.charactorNear=false;
			//this.addEventListener(MouseEvent.CLICK,onClick);
			}
		/*
		public function onClick(e:Event){
			changeStage(this.npcState);
			}*/
			
		public function changeState(inputState){
			if (inputState=="SLEEP"){
				this.gotoAndStop(1);
				}
			if (inputState=="WAKE" && charactorNear==true) {
				this.gotoAndStop(2);
				}
			}
		public function charactorNearme(cx,cy):Boolean{
			var _distance:Number;
			_distance = (this.x-cx)*(this.x-cx)+(this.y-cy)*(this.y-cy);
			_distance=Math.sqrt(_distance);
			if (_distance<=10) {
				return true;
				}
			else {
				return false;
				}
			}
		//this function determines if wzg is lies above or under the npcCat
		public function charactorOverme(cx,cy):Boolean{
			var _overme:Boolean;
			if (cy>this.y) {_overme=false}
				else {_overme=true};
			return _overme;
			}
		}
	
	}