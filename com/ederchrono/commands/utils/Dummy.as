package com.ederchrono.commands.utils
{
	import com.ederchrono.commands.Command;
	
	//this command simply does nothing and completes itself upon execution
	public class Dummy extends Command {
		
		public function Dummy() {
			
		}
		
		override protected function execute():void {
			complete();
		}
	}
}