package com.ederchrono.display
{
	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * @author Eder
	 */
	public class TiledSprite extends Sprite
	{
		public var TALEST_TILE:Number = 800;
		public var WIDEST_TILE:Number = 800;
		private var _debug:Boolean = false;
		private var tileList:Array;
		private var viewPort:Sprite;
		private var oldX:Number;
		private var oldY:Number;

		public function TiledSprite()
		{
			tileList = [];
			if (stage)
				addedHandler();
			else
				addEventListener(Event.ADDED_TO_STAGE, addedHandler);

			addEventListener(Event.REMOVED_FROM_STAGE, removedHandler);
		}

		public function removeTile(child:DisplayObject):void
		{
			var index:int = tileList.indexOf(child);
			if (index != -1)
			{
				try
				{
					removeChild(child);
				}
				catch(error:Error)
				{
				}

				tileList.splice(index, 1);
			}
			else
			{
				trace("[TiledSprite::removeTile(child)] - Tile not found");
			}
		}

		public function addTile(child:DisplayObject):void
		{
			if (tileList.indexOf(child) == -1)
			{
				tileList.push(child);
				update();
			}
			else
			{
				trace("[TiledSprite::addTile(child)] - Tile already added");
			}
		}

		public function setViewPort(_x:Number, _y:Number, _width:Number, _height:Number):void
		{
			viewPort.graphics.clear();
			viewPort.graphics.lineStyle(1, 0x000000);
			viewPort.graphics.beginFill(0x000000);
			viewPort.graphics.drawRect(0, 0, _width, _height);
			viewPort.graphics.endFill();
			viewPort.x = _x;
			viewPort.y = _y;
			update(true);
		}

		private function update(forced:Boolean = false):void
		{
			var changedPos:Boolean = oldX != x || oldY != y;
			if (stage && (forced || changedPos))
			{
				clear();

				stage.addChild(viewPort);
				var tlLength:int = tileList.length;
				for (var i:int = 0; i < tlLength; i++)
				{
					var dObj:DisplayObject = tileList[i];
					var realPos:Point = localToGlobal(new Point(dObj.x, dObj.y));
					if (realPos.x > -WIDEST_TILE && realPos.x < viewPort.width + WIDEST_TILE)
					{
						if (realPos.y > -TALEST_TILE && realPos.y < viewPort.height + TALEST_TILE)
						{
							addChild(dObj);
							if (!dObj.hitTestObject(viewPort))
							{
								removeChild(dObj);
							}
						}
					}
				}
				if (debug)
				{
					viewPort.alpha = .3;
				}
				else
				{
					stage.removeChild(viewPort);
				}
				oldX = x;
				oldY = y;
			}
		}

		private function clear():void
		{
			while (numChildren)
			{
				removeChildAt(0);
			}
		}

		private function removedHandler(e:Event):void
		{
			removeEventListener(Event.ENTER_FRAME, updateHandler);
		}

		private function addedHandler(e:Event = null):void
		{
			if (!viewPort)
			{
				viewPort = new Sprite();
				viewPort.mouseChildren = false;
				viewPort.mouseEnabled = false;
				setViewPort(0, 0, stage.stageWidth, stage.stageHeight);
			}
			addEventListener(Event.ENTER_FRAME, updateHandler, false, 0, true);
			update();
		}

		private function updateHandler(event:Event):void
		{
			update();
		}

		public function get debug():Boolean
		{
			return _debug;
		}

		public function set debug(debug:Boolean):void
		{
			_debug = debug;
			update(true);
		}
	}
}
