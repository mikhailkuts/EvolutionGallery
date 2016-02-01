/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.view.gallery.image.state {

import com.greensock.TweenLite;
import com.greensock.easing.Linear;

import com.codiano.model.GalleryConstants;

import com.codiano.view.gallery.image.GallerySprite;
import com.codiano.view.sm.State;

public class FadeOut implements State {

	private var _tweener	:TweenLite;

	private var _destroy	:Boolean;
	private var _sprite		:GallerySprite;

	public function FadeOut(sprite:GallerySprite, destroy:Boolean = false)
	{
		_sprite = sprite;
		_destroy = destroy;
	}

	public function enter():void
	{
		_tweener = TweenLite.to(_sprite, GalleryConstants.FADE_OUT_DURATION,
		{
			alpha:0,
			onComplete:onFadeComplete,
			ease:Linear.easeNone
		});
	}

	public function exit():void
	{
		if (_tweener)
		{
			_tweener.kill();
			_tweener = null;
		}
	}

	private function onFadeComplete():void
	{
		if (_destroy)
			_sprite.sm.changeState(new Destroy(_sprite));
	}

}
}
