/**
 * Created by kuts on 1/26/16.
 */
package view.gallery {

import flash.events.Event;

import org.as3commons.logging.api.ILogger;

import org.as3commons.logging.api.getLogger;

import robotlegs.bender.bundles.mvcs.Mediator;

public class GalleryMediator extends Mediator {

	private static const log		:ILogger 		= getLogger(GalleryMediator);

	[Inject]
	public var view					:GalleryView;

	override public function initialize():void
	{
		super.initialize();

		log.debug("Hello world :)");

		view.stage.addEventListener(Event.RESIZE, stage_onResize);
	}

	override public function destroy():void
	{
		view.stage.removeEventListener(Event.RESIZE, stage_onResize);

		super.destroy();
	}

	private function stage_onResize(event:Event):void
	{
		// layout
	}

}
}
