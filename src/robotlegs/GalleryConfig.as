/**
 * Created by kuts on 1/26/16.
 */
package robotlegs {

import flash.events.IEventDispatcher;

import model.GalleryModel;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import view.gallery.GalleryMediator;
import view.gallery.GalleryView;

public class GalleryConfig implements IConfig {

	[Inject]
	public var injector			:IInjector;

	[Inject]
	public var mediatorMap		:IMediatorMap;

	[Inject]
	public var contextView		:ContextView;

	[Inject]
	public var bus				:IEventDispatcher;

	public function configure():void
	{
		injector.map(GalleryModel).asSingleton();

		mediatorMap.map(GalleryView).toMediator(GalleryMediator);

		contextView.view.addChild(new GalleryView());
	}

}
}