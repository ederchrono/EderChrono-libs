package com.ederchrono.Math
{
	/**
	 * @author Eder
	 */
	public class MathUtils
	{
		
		public static function normalize(number:Number, min:Number, max:Number):Number
		{
			if (number < min)
			{
				number = min;
			}
			else if (number > max)
			{
				number = max;
			}
			return number;
		}
	}
}
