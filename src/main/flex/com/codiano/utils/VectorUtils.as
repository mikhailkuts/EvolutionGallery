/**
 * Created by kuts on 1/28/16.
 */
package com.codiano.utils {

public class VectorUtils {

	public static function unshiftFrom(vector:*, idx:int):void
	{
		var target:* = vector[idx];

		while (idx > 0)
		{
			vector[idx] = vector[idx - 1];
			--idx;
		}

		vector[idx] = target;
	}

	public static function pushFrom(vector:*, idx:int):void
	{
		var target:* = vector[idx];

		while (idx < vector.length - 1)
		{
			vector[idx] = vector[idx + 1];
			++idx;
		}

		vector[idx] = target;
	}

	public static function indexOf(vector:*, param:Object, comp:*):int
	{
		for(var i:uint = 0; i < vector.length; ++i)
			if (comp(vector[i], param))
				return i;

		return -1;
	}

}
}
