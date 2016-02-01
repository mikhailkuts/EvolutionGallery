/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.service.external {

import flash.events.Event;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.getLogger;

import com.codiano.service.loader.ExternalLoader;
import com.codiano.service.loader.ImageLoader;
import com.codiano.service.loader.LoaderFactory;
import com.codiano.service.loader.XMLLoader;

import com.codiano.signals.GalleryDataLoadedSignal;
import com.codiano.signals.GalleryImageLoadedSignal;

public class ExternalImagesServiceImpl implements ExternalImagesService {

	private static const log		:ILogger 				= getLogger(ExternalImagesServiceImpl);

	[Inject]
	public var dataLoadedSignal		:GalleryDataLoadedSignal;

	[Inject]
	public var imageLoadedSignal	:GalleryImageLoadedSignal;

	private var _imagesData			:XML 					= null;

	public function loadImagesData(url:String):void
	{
		var xmlLoader:ExternalLoader = LoaderFactory.createLoader(url);
		xmlLoader.addEventListener(Event.COMPLETE, xmlLoader_onComplete);
		xmlLoader.load();
	}

	public function loadImage(url:String):void
	{
		var imgLoader:ExternalLoader = LoaderFactory.createLoader(url);
		imgLoader.addEventListener(Event.COMPLETE, imgLoader_onComplete);
		imgLoader.load();
	}

	private function xmlLoader_onComplete(event:Event):void
	{
		var loader:XMLLoader = event.target as XMLLoader;
		loader.removeEventListener(Event.COMPLETE, xmlLoader_onComplete);

		_imagesData = XML(loader.data);

		dataLoadedSignal.dispatch(imagesData);
	}

	private function imgLoader_onComplete(event:Event):void
	{
		var loader:ImageLoader = event.target as ImageLoader;
		loader.removeEventListener(Event.COMPLETE, imgLoader_onComplete);

		imageLoadedSignal.dispatch(loader.url, loader.data);
	}

	public function get imagesData():XML
	{
		return _imagesData;
	}

}
}
