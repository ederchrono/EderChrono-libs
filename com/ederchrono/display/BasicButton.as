package com.ederchrono.display
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.MovieClip;

	/**
	 * @author Eder
	 */
	public class BasicButton
	{
		private var _enabled:Boolean;
		private var _mc:MovieClip;

		public function BasicButton(mc:MovieClip)
		{
			_mc = mc;

			_enabled = true;

			_mc.addEventListener(Event.REMOVED_FROM_STAGE, removedToStage_handler, false, 0, true);
			setHitArea();
			initialize();
		}

		protected function setHitArea():void
		{
			var mc_hitarea:MovieClip = MovieClip(_mc.getChildByName("hitarea_mc"));
			mc_hitarea.visible = false;
			_mc.hitArea = mc_hitarea;
		}

		private function removedToStage_handler(e:Event):void
		{
			dispose();
		}

		protected function initialize():void
		{
			_mc.buttonMode = true;
			_mc.mouseChildren = false;
			_mc.addEventListener(MouseEvent.ROLL_OVER, rollOver_handler, false, 0, true);
			_mc.addEventListener(MouseEvent.ROLL_OUT, rollOut_handler, false, 0, true);
		}

		public function getEnabled():Boolean
		{
			return _enabled;
		}

		public function setEnabled(value:Boolean):void
		{
			_enabled = value;

			if (_enabled)
			{
				_mc.addEventListener(MouseEvent.ROLL_OVER, rollOver_handler, false, 0, true);
				_mc.addEventListener(MouseEvent.ROLL_OUT, rollOut_handler, false, 0, true);
			}
			else
			{
				removeAllListeners();
			}

			_mc.mouseEnabled = _enabled;
		}

		protected function rollOver_handler(e:MouseEvent):void
		{
			_mc.gotoAndPlay("over");
		}

		protected function rollOut_handler(e:MouseEvent):void
		{
			_mc.gotoAndPlay("out");
		}

		protected function removeAllListeners():void
		{
			_mc.removeEventListener(MouseEvent.ROLL_OVER, rollOver_handler, false);
			_mc.removeEventListener(MouseEvent.ROLL_OUT, rollOut_handler, false);
		}

		protected function dispose():void
		{
			removeAllListeners();

			_mc.removeEventListener(Event.REMOVED_FROM_STAGE, removedToStage_handler);
		}

		public function get mc():MovieClip
		{
			return _mc;
		}
	}
}
