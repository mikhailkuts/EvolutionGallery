/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.controller {

import com.codiano.model.GalleryConstants;
import com.codiano.model.GalleryModel;
import com.codiano.signals.ShowNextGalleryImageSignal;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class CreateGalleryImagesCommand implements ICommand {

	[Inject]
	public var imagesData			:XML;

	[Inject]
	public var galleryModel			:GalleryModel;

	[Inject]
	public var nextImageSignal		:ShowNextGalleryImageSignal;

	public function execute():void
	{
		galleryModel.createFromXML(imagesData);

		for (var imgIdx:uint = 0; imgIdx < GalleryConstants.IMAGES_BATCH; imgIdx++)
			nextImageSignal.dispatch();
	}

}
}
