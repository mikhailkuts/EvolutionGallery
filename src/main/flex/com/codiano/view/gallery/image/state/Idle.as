/**
 * Created by kuts on 1/28/16.
 */
package com.codiano.view.gallery.image.state {

import flash.events.MouseEvent;

import com.codiano.view.gallery.image.GallerySprite;
import com.codiano.view.sm.State;

public class Idle implements State {

	private var _sprite			:GallerySprite;

	public function Idle(sprite:GallerySprite)
	{
		_sprite = sprite;
	}

	public function enter():void
	{
		_sprite.addEventListener(MouseEvent.CLICK, sprite_onMouseClick);
	}

	public function exit():void
	{
		_sprite.removeEventListener(MouseEvent.CLICK, sprite_onMouseClick);
	}

	private function sprite_onMouseClick(me:MouseEvent):void
	{
		_sprite.sm.changeState(new FadeOut(_sprite, true));
	}

}
}
