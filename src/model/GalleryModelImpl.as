/**
 * Created by kuts on 1/26/16.
 */
package model {

import org.osflash.signals.Signal;

public class GalleryModelImpl implements GalleryModel {

	private var _imageAddedSignal			:Signal 		= new Signal();

	public function GalleryModelImpl()
	{
	}

	public function get imageAddedSignal():Signal
	{
		return _imageAddedSignal;
	}

}
}
