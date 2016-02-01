/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.service.loader {

import flash.display.Loader;
import flash.net.URLRequest;

public class ImageLoader extends LoaderImpl implements ExternalLoader {

	private var _loader			:Loader 		= new Loader();

	public function ImageLoader(url:String)
	{
		super(url);
	}

	override public function load():void
	{
		subscribe(_loader.contentLoaderInfo);

		_loader.load(new URLRequest(url));
	}

	override public function get data():*
	{
		return _loader.content;
	}
}
}
