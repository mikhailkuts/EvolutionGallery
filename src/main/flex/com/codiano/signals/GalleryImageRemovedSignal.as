/**
 * Created by kuts on 1/28/16.
 */
package com.codiano.signals {

import com.codiano.model.image.GalleryImage;

import org.osflash.signals.Signal;

public class GalleryImageRemovedSignal extends Signal {

	public function GalleryImageRemovedSignal()
	{
		super(GalleryImage);
	}

}
}
