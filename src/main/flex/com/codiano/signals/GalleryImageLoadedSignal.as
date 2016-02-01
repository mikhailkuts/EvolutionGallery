/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.signals {

import flash.display.Bitmap;

import org.osflash.signals.Signal;

public class GalleryImageLoadedSignal extends Signal {

	public function GalleryImageLoadedSignal()
	{
		super(String, Bitmap);
	}

}
}
