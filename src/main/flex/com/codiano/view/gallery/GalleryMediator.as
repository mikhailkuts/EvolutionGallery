/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.view.gallery {

import flash.utils.Dictionary;

import com.codiano.model.GalleryModel;
import com.codiano.model.ObjectsPool;
import com.codiano.model.image.GalleryImage;
import com.codiano.signals.GalleryImageAddedSignal;
import com.codiano.signals.GalleryImageRemovedSignal;
import com.codiano.signals.ShowNextGalleryImageSignal;
import com.codiano.utils.packer.PackerRect;
import com.codiano.utils.packer.RectPacker;
import com.codiano.view.gallery.image.GallerySprite;
import com.codiano.view.gallery.image.state.FadeIn;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

import robotlegs.bender.bundles.mvcs.Mediator;

public class GalleryMediator extends Mediator {

	private static const log				:ILogger 				= getLogger(GalleryMediator);

	[Inject]
	public var view							:GalleryView;

	[Inject]
	public var galleryModel					:GalleryModel;

	[Inject]
	public var galleryImageAddedSignal		:GalleryImageAddedSignal;

	[Inject]
	public var galleryImageRemovedSignal	:GalleryImageRemovedSignal;

	[Inject]
	public var nextImageSignal				:ShowNextGalleryImageSignal;

	private var _spritesHash				:Dictionary 			= new Dictionary();

	private var _packer						:RectPacker 			= new RectPacker();

	override public function initialize():void
	{
		super.initialize();

		galleryImageAddedSignal.add(imageAddedSignal_onDispatch);
		galleryImageRemovedSignal.add(imageRemovedSignal_onDispatch);
	}

	override public function destroy():void
	{
		galleryImageAddedSignal.remove(imageAddedSignal_onDispatch);
		galleryImageRemovedSignal.remove(imageRemovedSignal_onDispatch);

		super.destroy();
	}

	private function layoutChildren():void
	{
		while (view.numChildren)
			view.removeChildAt(0);

		var area:PackerRect = new PackerRect(
			view.stage.stageWidth * 0.5,
			view.stage.stageHeight * 0.5,
			view.stage.stageWidth,
			view.stage.stageHeight
		);

		var packRects:Vector.<PackerRect> = new <PackerRect>[];
		var galleryImage:GalleryImage;

		for each (var sprite:GallerySprite in _spritesHash)
		{
			galleryImage = galleryModel.getImage(sprite.key);

			packRects.push(
				new PackerRect(
					area.x,
					area.y,
					galleryImage.bitmap.width,
					galleryImage.bitmap.height,
					sprite.key
				)
			);
		}

		packRects.sort(
			function (a:PackerRect, b:PackerRect):int
			{
				if (a.size > b.size)
					return -1;
				else if (a.size < b.size)
					return 1;
				else
					return 0;
			}
		);

		packRects = _packer.pack(area, packRects);

		for each (var packRect:PackerRect in packRects)
		{
			sprite = _spritesHash[packRect.emitter];

			sprite.x = packRect.x - packRect.width * 0.5;
			sprite.y = packRect.y - packRect.height * 0.5;

			view.addChild(sprite);
		}

	}

	private function imageAddedSignal_onDispatch(image:GalleryImage):void
	{
		var sprite:GallerySprite = ObjectsPool.gallerySpritesPool.borrowObject();

		sprite.key = image.key;

		_spritesHash[image.key] = sprite;

		layoutChildren();

		sprite.sm.changeState(new FadeIn(sprite));
	}

	private function imageRemovedSignal_onDispatch(image:GalleryImage):void
	{
		var sprite:GallerySprite = _spritesHash[image.key];

		view.removeChild(sprite);

		sprite.reset();

		ObjectsPool.gallerySpritesPool.returnObject(sprite);

		delete _spritesHash[image.key];

		nextImageSignal.dispatch();
	}

}
}
