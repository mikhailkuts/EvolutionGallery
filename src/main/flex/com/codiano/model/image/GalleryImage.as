/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.model.image {

import flash.display.Bitmap;

public interface GalleryImage {

	function get key()					:String;
	function set key(value:String)		:void;

	function get bitmap()				:Bitmap;
	function set bitmap(value:Bitmap)	:void;

	function get busy()					:Boolean;
	function set busy(value:Boolean)	:void;

}
}
