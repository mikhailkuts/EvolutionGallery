/**
 * Created by kuts on 1/26/16.
 */
package com.codiano.robotlegs {

import com.codiano.controller.AddGalleryImageCommand;
import com.codiano.controller.CreateGalleryImagesCommand;
import com.codiano.controller.LoadGalleryDataCommand;
import com.codiano.controller.RemoveGalleryImageCommand;
import com.codiano.controller.ShowNextGalleryImageCommand;
import com.codiano.model.GalleryModel;
import com.codiano.model.GalleryModelImpl;
import com.codiano.service.external.ExternalImagesService;
import com.codiano.service.external.ExternalImagesServiceImpl;
import com.codiano.signals.GalleryDataLoadedSignal;
import com.codiano.signals.GalleryImageAddedSignal;
import com.codiano.signals.GalleryImageLoadedSignal;
import com.codiano.signals.GalleryImageRemovedSignal;
import com.codiano.signals.LoadGalleryDataSignal;
import com.codiano.signals.RemoveGalleryImageSignal;
import com.codiano.signals.ShowNextGalleryImageSignal;
import com.codiano.view.gallery.GalleryMediator;
import com.codiano.view.gallery.GalleryView;
import com.codiano.view.gallery.image.GallerySprite;
import com.codiano.view.gallery.image.GallerySpriteMediator;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IInjector;

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
		injector.map(LoadGalleryDataSignal).asSingleton();
		injector.map(GalleryDataLoadedSignal).asSingleton();
		injector.map(GalleryImageLoadedSignal).asSingleton();
		injector.map(RemoveGalleryImageSignal).asSingleton();
		injector.map(ShowNextGalleryImageSignal).asSingleton();
		injector.map(GalleryImageAddedSignal).asSingleton();
		injector.map(GalleryImageRemovedSignal).asSingleton();

		// Commands mapping
		signalCommandMap.map(LoadGalleryDataSignal).toCommand(LoadGalleryDataCommand);
		signalCommandMap.map(GalleryDataLoadedSignal).toCommand(CreateGalleryImagesCommand);
		signalCommandMap.map(GalleryImageLoadedSignal).toCommand(AddGalleryImageCommand);
		signalCommandMap.map(RemoveGalleryImageSignal).toCommand(RemoveGalleryImageCommand);
		signalCommandMap.map(ShowNextGalleryImageSignal).toCommand(ShowNextGalleryImageCommand);

		// Model mapping
		injector.map(GalleryModel).toSingleton(GalleryModelImpl);

		// Services mapping
		injector.map(ExternalImagesService).toSingleton(ExternalImagesServiceImpl);

		// View mapping
		mediatorMap.map(GalleryView).toMediator(GalleryMediator);
		mediatorMap.map(GallerySprite).toMediator(GallerySpriteMediator);
	}

	private function context_onInitialed():void
	{
		(injector.getInstance(LoadGalleryDataSignal) as LoadGalleryDataSignal).dispatch();
	}

}
}