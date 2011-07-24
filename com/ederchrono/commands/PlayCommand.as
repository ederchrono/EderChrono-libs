package com.ederchrono.commands
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class PlayCommand extends Command {
		
		private var _movieClip:MovieClip;
		
		public function PlayCommand(delay:Number, movieClip:MovieClip) {
			super(delay);
			_movieClip = movieClip;
		}
		
		override protected function execute():void {
			_movieClip.addEventListener(Event.COMPLETE, complete);
			_movieClip.play();
		}
	}
}