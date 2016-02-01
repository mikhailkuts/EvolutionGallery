/**
 * Created by kuts on 1/26/16.
 */
package com.codiano {

import com.codiano.utils.ArrayUtils;
import com.codiano.utils.VectorUtils;
import com.codiano.utils.packer.PackerRect;
import com.codiano.utils.packer.RectPacker;

import flexunit.framework.Assert;

public class TestApp {

	[Test]
	public function unshiftFromTest():void
	{
		var vec:Vector.<int> = new <int>[1, 2, 3, 4, 5];

		var size:int = vec.length;
		var element:int = vec[2];

		VectorUtils.unshiftFrom(vec, 2);

		Assert.assertTrue(vec.length == size);
		Assert.assertTrue(vec[0] == element);;
	}

	[Test]
	public function pushFromTest():void
	{
		var vec:Vector.<int> = new <int>[1, 2, 3, 4, 5];

		var size:int = vec.length;
		var element:int = vec[2];

		VectorUtils.pushFrom(vec, 2);

		Assert.assertTrue(vec.length == size);
		Assert.assertTrue(vec[size - 1] == element);
	}

	[Test]
	public function arraySortTest():void
	{
		var arr1:Array = [1, 3, 4, 5, 7, 9, 11];
		var arr2:Array = [2, 4, 4, 4, 4, 6, 8, 10];

		var arr3:Array = ArrayUtils.sortedMerge(arr1, arr2);

		Assert.assertTrue(arr3.length == arr1.length + arr2.length);

		if (arr3.length > 1)
			for (var i:int = 0; i < arr3.length - 1; i++)
				Assert.assertFalse(arr3[i + 1] < arr3[i])
	}

	[Test]
	public function rectPackerTest():void
	{
		var packer:RectPacker = new RectPacker();

		var area:PackerRect = new PackerRect(300, 300, 600, 600);

		var packRects:Vector.<PackerRect> = new <PackerRect>[];

		for (var i:int = 0; i < 15; i++)
		{
			packRects.push(
				new PackerRect(
					area.x,
					area.y,
					70 + Math.random() * 150,
					70 + Math.random() * 150
				)
			);
		}

		packRects = packer.pack(area, packRects);

		for each (var packRect:PackerRect in packRects)
			Assert.assertFalse(packer.checkCollisions(packRect, packRects))
	}
}
}
