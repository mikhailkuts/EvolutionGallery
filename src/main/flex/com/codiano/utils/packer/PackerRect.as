/**
 * Created by kuts on 1/29/16.
 */
package com.codiano.utils.packer {

public class PackerRect {

	public var emitter			:Object;

	public var originalX		:Number 	= NaN;
	public var originalY		:Number 	= NaN;

	public var x				:int;
	public var y				:int;

	public var width			:int;
	public var height			:int;

	public var left				:int;
	public var top				:int;
	public var right			:int;
	public var bottom			:int;

	public var size				:Number;

	public function PackerRect(x:int, y:int, width:int, height:int, emitter:Object = null)
	{
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.size = Math.sqrt(width * width + height * height);

		this.emitter = emitter;

		calculateBounds();
	}

	public function clone():PackerRect
	{
		var rect:PackerRect = new PackerRect(x, y, width, height);

		rect.emitter = emitter;
		rect.size = size;
		rect.calculateBounds();

		return rect;
	}

	public function calculateBounds():void
	{
		left = x - width * 0.5;
		right = x + width * 0.5;
		top = y - height * 0.5;
		bottom = y + height * 0.5;
	}

}
}
