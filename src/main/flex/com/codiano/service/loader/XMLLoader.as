/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.service.loader {

import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLLoader extends LoaderImpl {

	private var _loader			:URLLoader 		= new URLLoader();

	public function XMLLoader(url:String)
	{
		super(url);
	}

	override public function load():void
	{
		subscribe(_loader);

		_loader.load(new URLRequest(url));
	}

	override public function get data():*
	{
		return _loader.data;
	}

}
}
