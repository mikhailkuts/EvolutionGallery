/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.view.gallery.image {

import flash.display.Sprite;
import flash.events.Event;

import com.codiano.view.sm.StateMachine;
import com.codiano.view.sm.StateMachineImpl;

public class GallerySprite extends Sprite {

	public static const NAME		:String 		= "GallerySprite";

	public static const DESTROY		:String 		= NAME + "Destroy";

	private var _key				:String;
	private var _sm					:StateMachine	= new StateMachineImpl();

	public function destroy():void
	{
		dispatchEvent(new Event(DESTROY));
	}

	public function reset():void
	{
		_key = null;
		_sm = new StateMachineImpl();
	}

	public function get sm():StateMachine
	{
		return _sm;
	}

	public function set key(value:String):void
	{
		_key = value;
	}

	public function get key():String
	{
		return _key;
	}

}
}
