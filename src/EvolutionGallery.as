/**
 * Created by kuts on 1/26/16.
 */
package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;

import org.as3commons.logging.api.ILogger;
import org.as3commons.logging.api.LOGGER_FACTORY;
import org.as3commons.logging.api.getLogger;
import org.as3commons.logging.setup.SimpleTargetSetup;
import org.as3commons.logging.setup.target.TraceTarget;

import robotlegs.GalleryConfig;
import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.impl.Context;

use namespace LOGGER_FACTORY;

[SWF(width="1000", height="600", frameRate="60", backgroundColor="#000000")]
public class EvolutionGallery extends Sprite
{
	private static const log				:ILogger 			= getLogger(EvolutionGallery);

	public function EvolutionGallery()
	{
		loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_onComplete);
	}

	public function loaderInfo_onComplete(event:Event):void
	{
		loaderInfo.removeEventListener(Event.COMPLETE, loaderInfo_onComplete);

		init();
	}

	private function init():void
	{
		initLogging();
		initNativeStage();
		initRobotlegs();
	}

	private function initLogging():void
	{
		LOGGER_FACTORY.setup = new SimpleTargetSetup(new TraceTarget());
	}

	private function initNativeStage():void
	{
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
	}

	private function initRobotlegs():void
	{
		new Context()
			.install(MVCSBundle)
			.configure(GalleryConfig, new ContextView(this));
	}

}
}