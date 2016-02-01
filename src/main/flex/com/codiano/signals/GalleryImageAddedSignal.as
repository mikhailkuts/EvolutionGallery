/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.signals {

import com.codiano.model.image.GalleryImage;

import org.osflash.signals.Signal;

public class GalleryImageAddedSignal extends Signal {

	public function GalleryImageAddedSignal()
	{
		super(GalleryImage);
	}

}
}
