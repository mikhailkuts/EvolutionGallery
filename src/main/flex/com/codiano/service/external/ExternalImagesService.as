/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.service.external {

public interface ExternalImagesService {

	function loadImagesData(url:String)		:void;
	function loadImage(url:String)			:void;

	function get imagesData()				:XML;

}
}
