/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.service.loader {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;

public class LoaderImpl extends EventDispatcher implements ExternalLoader {

	private var _url			:String;

	public function LoaderImpl(url:String)
	{
		_url = url;
	}

	public function load():void
	{
		throw new Error("Method should be overridden");
	}

	protected function subscribe(dispatcher:IEventDispatcher):void
	{
		dispatcher.addEventListener(Event.COMPLETE, dispatcher_onComplete);
		dispatcher.addEventListener(IOErrorEvent.IO_ERROR, dispatcher_onError);
		dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, dispatcher_onError);
	}

	public function unsubscribe(dispatcher:IEventDispatcher):void
	{
		dispatcher.removeEventListener(Event.COMPLETE, dispatcher_onComplete);
		dispatcher.removeEventListener(IOErrorEvent.IO_ERROR, dispatcher_onError);
		dispatcher.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, dispatcher_onError);
	}

	protected function dispatcher_onComplete(event:Event):void
	{
		unsubscribe(event.target as IEventDispatcher);

		dispatchEvent(new Event(Event.COMPLETE));
	}

	protected function dispatcher_onError(event:Event):void
	{
		unsubscribe(event.target as IEventDispatcher);

		throw new Error("Error while loading file " + url);
	}

	public function get url():String
	{
		return _url;
	}

	public function get data():*
	{
		throw new Error("Method should be overridden");
	}

}
}
