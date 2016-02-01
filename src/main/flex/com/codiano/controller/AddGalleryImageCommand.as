/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.controller {

import flash.display.Bitmap;

import com.codiano.model.GalleryModel;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class AddGalleryImageCommand implements ICommand {

	[Inject]
	public var imageKey			:String;

	[Inject]
	public var imageBitmap		:Bitmap;

	[Inject]
	public var galleryModel		:GalleryModel;

	public function execute():void
	{
		galleryModel.setBitmap(imageKey, imageBitmap);
	}

}
}
