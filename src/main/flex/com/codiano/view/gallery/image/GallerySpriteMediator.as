/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.view.gallery.image {

import flash.events.Event;

import com.codiano.model.GalleryModel;
import com.codiano.model.image.GalleryImage;
import com.codiano.signals.RemoveGalleryImageSignal;

import robotlegs.bender.bundles.mvcs.Mediator;

public class GallerySpriteMediator extends Mediator {

	[Inject]
	public var view					:GallerySprite;

	[Inject]
	public var galleryModel			:GalleryModel;

	[Inject]
	public var removeImageSignal	:RemoveGalleryImageSignal;

	override public function initialize():void
	{
		super.initialize();

		view.buttonMode = true;

		addViewListener(GallerySprite.DESTROY, view_onDestroy);

		setBitmap();
	}

	private function setBitmap():void
	{
		var image:GalleryImage = galleryModel.getImage(view.key);
		view.addChild(image.bitmap);
	}

	private function view_onDestroy(event:Event):void
	{
		var image:GalleryImage = galleryModel.getImage(view.key);
		view.removeChild(image.bitmap);

		removeImageSignal.dispatch(image);
	}

}
}
