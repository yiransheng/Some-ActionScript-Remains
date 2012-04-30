package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/****************************************
	 *            Core Game Play            *
	 ****************************************/
	 
	
	
	public class gamestage extends MovieClip{
		//main charactor: wzg
		private var wzg:charactor;
		//cat duplicate 1: lies behind wzg
		private var catB:npcCat;
		//cat duplicate 2: lies in front of wzg
		private var catF:npcCat;
		//collideTest is an invisible sprite that defines the walkable area on game stage
		private var collideTest:area;
		public function gamestage(){
			catB = new npcCat(150,200,"SLEEP");
			addChildAt(catB,0);
			wzg = new charactor(600,100);
			addChildAt(wzg,1);
			catF = new npcCat(150,200,"SLEEP");
			addChildAt(catF,2);
			collideTest = new area();
			addChild(collideTest);
			this.addEventListener(Event.ENTER_FRAME,oef);			
			this.addEventListener(MouseEvent.CLICK,onClick);
			}
		public function oef(e:Event) {
			wzgwalk();
			catB.charactorNear=catB.charactorNearme(wzg.x,wzg.y);
			catF.charactorNear=catF.charactorNearme(wzg.x,wzg.y);
			catF.visible=catF.charactorOverme(wzg.x,wzg.y);
			}
		public function onClick(e:Event){
			wzg.destx=this.mouseX;
			wzg.desty=this.mouseY;
			var _angle=Math.atan2(wzg.desty-wzg.y,wzg.destx-wzg.x);
			wzg.angle=_angle;
			wzg.step=5;
			}
		public function wzgwalk(){
				var tempX=wzg.x+wzg.step*Math.cos(wzg.angle);
				var tempY=wzg.y+wzg.step*Math.sin(wzg.angle);
				var hitX=tempX+this.x;
				var hitY=tempY+this.y;
				//test if the next step falls into a unreachable point
				if ((collideTest.hitTestPoint(hitX,hitY,true)==true) && (Math.abs(wzg.destx-wzg.x)>5)){
					wzg.update(tempX,tempY);
					}
				else{
					wzg.stand();
					}
			}
		}
	
	}  