/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.model.image {

import flash.display.Bitmap;

public class GalleryImageImpl implements GalleryImage {

	private var _key				:String;
	private var _bitmap				:Bitmap;

	private var _busy				:Boolean 		= false;

	public function get key():String
	{
		return _key;
	}

	public function set key(value:String):void
	{
		_key = value;
	}

	public function get bitmap():Bitmap
	{
		return _bitmap;
	}

	public function set bitmap(value:Bitmap):void
	{
		_bitmap = value;
	}

	public function get busy():Boolean
	{
		return _busy;
	}

	public function set busy(value:Boolean):void
	{
		_busy = value;
	}

}
}
