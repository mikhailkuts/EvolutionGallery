/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.view.gallery.image.state {

import com.greensock.TweenLite;
import com.greensock.easing.Linear;

import com.codiano.model.GalleryConstants;

import com.codiano.view.gallery.image.GallerySprite;
import com.codiano.view.sm.State;

public class FadeIn implements State {

	private var _tweener	:TweenLite;

	private var _sprite		:GallerySprite;

	public function FadeIn(sprite:GallerySprite)
	{
		_sprite = sprite;
	}

	public function enter():void
	{
		_sprite.alpha = 0;

		_tweener = TweenLite.to(_sprite, GalleryConstants.FADE_IN_DURATION,
		{
			alpha:1,
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
		_sprite.sm.changeState(new Idle(_sprite));
	}

}
}
