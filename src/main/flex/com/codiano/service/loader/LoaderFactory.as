/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.service.loader {

public class LoaderFactory {

	public static function createLoader(url:String):ExternalLoader
	{
		var ext:String = url.substring(url.lastIndexOf("."), url.length);

		if (ext == ".png" || ext == ".jpg")
			return new ImageLoader(url);
		else if (ext == ".xml")
			return new XMLLoader(url);
		else
			throw new Error("");
		throw new Error("Loader not supported");
	}

}
}
