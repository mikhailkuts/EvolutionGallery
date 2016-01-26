/**
 * Created by kuts on 1/26/16.
 */
package robotlegs {

import controller.StartGallery;

import model.GalleryModel;
import model.GalleryModelImpl;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IInjector;

import service.LoadImageService;
import service.LoadImageServiceImpl;

import signals.LoadGallerySignal;

import view.gallery.GalleryMediator;
import view.gallery.GalleryView;

public class GalleryConfig implements IConfig {

	[Inject]
	public var injector				:IInjector;

	[Inject]
	public var context				:IContext;

	[Inject]
	public var mediatorMap			:IMediatorMap;

	[Inject]
	public var signalCommandMap		:ISignalCommandMap;

	public function configure():void
	{
		// Startup handler
		context.afterInitializing(context_onInitialed);

		// Signals mapping
		injector.map(LoadGallerySignal).asSingleton();

		// Commands mapping
		signalCommandMap.map(LoadGallerySignal).toCommand(StartGallery);

		// Model mapping
		injector.map(GalleryModel).toSingleton(GalleryModelImpl);

		// Services mapping
		injector.map(LoadImageService).toSingleton(LoadImageServiceImpl);

		// View mapping
		mediatorMap.map(GalleryView).toMediator(GalleryMediator);
	}

	private function context_onInitialed():void
	{
		(injector.getInstance(LoadGallerySignal) as LoadGallerySignal).dispatch();
	}

}
}