/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.model {

import flash.display.Bitmap;

import com.codiano.model.image.GalleryImage;
import com.codiano.model.image.GalleryImageImpl;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

import com.codiano.signals.GalleryImageAddedSignal;
import com.codiano.signals.GalleryImageRemovedSignal;

import com.codiano.utils.VectorUtils;

public class GalleryModelImpl implements GalleryModel {

	private static const log			:ILogger 					= getLogger(GalleryModelImpl);

	[Inject]
	public var imageAddedSignal			:GalleryImageAddedSignal;

	[Inject]
	public var imageRemovedSignal		:GalleryImageRemovedSignal;

	private var _images					:Vector.<GalleryImage> 		= new <GalleryImage>[];

	public function createFromXML(data:XML):void
	{
		var nodes:XMLList = data.children();
		var image:GalleryImage;

		for each (var node:XML in nodes)
		{
			image = new GalleryImageImpl();
			image.key = node.@url;

			_images.push(image);
		}
	}

	public function setBitmap(key:String, bitmap:Bitmap):void
	{
		var image:GalleryImage = getImage(key);
		image.bitmap = bitmap;

		VectorUtils.unshiftFrom(_images, _images.indexOf(image));

		imageAddedSignal.dispatch(image);
	}

	public function removeBitmap(key:String):void
	{
		var image:GalleryImage = getImage(key);
		image.bitmap = null;

		VectorUtils.pushFrom(_images, _images.indexOf(image));

		imageRemovedSignal.dispatch(image);
	}

	public function getImage(key:String):GalleryImage
	{
		var idx:int = VectorUtils.indexOf(_images, key,
			function compare(image:GalleryImage, key:String):Boolean
			{
				return image.key == key;
			}
		);

		return idx != -1 ? _images[idx] : null;
	}

	public function getEmptyImage():GalleryImage
	{
		var emptyIdx:int = VectorUtils.indexOf(_images, null,
			function compare(image:GalleryImage, key:String):Boolean
			{
				return image.bitmap == null && !image.busy;
			}
		);

		return emptyIdx != -1 ? _images[emptyIdx] : null;
	}

}
}
