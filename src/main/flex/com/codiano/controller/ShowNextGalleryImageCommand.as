/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.controller {

import com.codiano.model.GalleryModel;
import com.codiano.model.image.GalleryImage;
import com.codiano.service.external.ExternalImagesService;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class ShowNextGalleryImageCommand implements ICommand {

	[Inject]
	public var galleryService		:ExternalImagesService;

	[Inject]
	public var galleryModel			:GalleryModel;

	public function execute():void
	{
		var emptyImage:GalleryImage = galleryModel.getEmptyImage();

		emptyImage.busy = true;

		galleryService.loadImage(emptyImage.key);
	}

}
}
