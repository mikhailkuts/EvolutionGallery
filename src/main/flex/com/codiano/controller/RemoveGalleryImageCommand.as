/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.controller {

import com.codiano.model.GalleryModel;
import com.codiano.model.image.GalleryImage;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class RemoveGalleryImageCommand implements ICommand {

	[Inject]
	public var image			:GalleryImage;

	[Inject]
	public var galleryModel		:GalleryModel;

	public function execute():void
	{
		image.bitmap.bitmapData.dispose();
		image.busy = false;

		galleryModel.removeBitmap(image.key);
	}

}
}
