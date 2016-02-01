/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.controller {

import com.codiano.model.GalleryConstants;
import com.codiano.service.external.ExternalImagesService;
import com.codiano.view.gallery.GalleryView;

import robotlegs.bender.extensions.commandCenter.api.ICommand;
import robotlegs.bender.extensions.contextView.ContextView;

public class LoadGalleryDataCommand implements ICommand {

	[Inject]
	public var contextView			:ContextView;

	[Inject]
	public var galleryService		:ExternalImagesService;

	public function execute():void
	{
		contextView.view.addChild(new GalleryView());

		galleryService.loadImagesData(GalleryConstants.IMAGES_DATA_URL);
	}

}
}
