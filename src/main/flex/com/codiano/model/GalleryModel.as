/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.model {

import flash.display.Bitmap;

import com.codiano.model.image.GalleryImage;

public interface GalleryModel {

	function createFromXML(data:XML)					:void;

	function setBitmap(key:String, bitmap:Bitmap)		:void;
	function removeBitmap(key:String)					:void;
	function getImage(key:String)						:GalleryImage;
	function getEmptyImage()							:GalleryImage;

}
}
