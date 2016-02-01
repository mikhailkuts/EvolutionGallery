/**
 * Created by kuts on 1/28/16.
 */
package com.codiano.view.gallery.image.state {

import com.codiano.view.gallery.image.GallerySprite;
import com.codiano.view.sm.State;

public class Destroy implements State {

	private var _sprite		:GallerySprite;

	public function Destroy(sprite:GallerySprite)
	{
		_sprite = sprite;
	}

	public function enter():void
	{
		_sprite.destroy();
	}

	public function exit():void
	{

	}

}
}
