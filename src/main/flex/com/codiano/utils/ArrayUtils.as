/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.utils {

public class ArrayUtils {

	public static function sortedMerge(arr1:Array, arr2:Array):Array
	{
		var i:int = 0;
		var j:int = 0;
		var k:int = 0;

		var m:int = arr1.length;
		var n:int = arr2.length;

		var result:Array = [];

		while (i < m && j < n)
		{
			if (arr1[i] <= arr2[j])
			{
				result[k] = arr1[i];
				i++;
			}
			else
			{
				result[k] = arr2[j];
				j++;
			}
			k++;
		}

		if (i < m)
			for (var p:int = i; p < m; p++)
			{
				result[k] = arr1[p];
				k++;
			}
		else
			for (p = j; p < n; p++)
			{
				result[k] = arr2[p];
				k++;
			}

		return result;
	}

}
}
