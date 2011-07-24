package com.ederchrono.bitmap
{
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import flash.display.DisplayObjectContainer;
	import flash.display.BitmapData;
	/**
	 * @author Eder
	 */
	public class BitmapUtils
	{
		public static function takeScreenShot(dObj:DisplayObjectContainer, width:int, height:int, rect:Rectangle = null):Bitmap
		{
			var bmd:BitmapData = new BitmapData(width, height, false, 0x000000);
			bmd.draw(dObj, null, null, null, rect, true);
			
			var bm:Bitmap = new Bitmap(bmd);
			bm.smoothing = true;
			return bm;
		}
		
	}
}
