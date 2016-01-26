/**
 * Created by kuts on 1/26/16.
 */
package model {

import flash.events.Event;

import mx.events.DynamicEvent;

public dynamic class ModelEvent extends DynamicEvent
{
	public static const	NAME									:String	= "ModelEvent";

	public static const ON_EVENT								:String	= NAME + "OnEvent";

	private var _emitter										:Object;

	public function ModelEvent(eventType:String, emitter:Object = null, params:Object = null)
	{
		super(eventType, false, false);

		_emitter = emitter;

		if (params != null)
			for (var key:String in params)
				this[key] = params[key];
	}

	override public function clone():Event
	{
		var event:ModelEvent = new ModelEvent(type, _emitter);

		for (var p:String in this)
			event[p] = this[p];

		return event;
	}

}
}
