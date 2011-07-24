package com.ederchrono.stage
{
	import flash.display.Stage;
	/**
	 * @author Eder
	 */
	public class StageUtils
	{
		public static function calculateStageScale(stage:Stage, baseWidth:Number, baseHeight:Number):ScaleVars
		{
			var scaleVars:ScaleVars = new ScaleVars();
			scaleVars.scaleX = stage.stageWidth / baseWidth;
			scaleVars.scaleY = stage.stageHeight / baseHeight;
			if (scaleVars.scaleX > scaleVars.scaleY)
			{
				scaleVars.scale = scaleVars.scaleX;
			}
			else
			{
				scaleVars.scale = scaleVars.scaleY;
			}
			return scaleVars;
		}
	}
}
