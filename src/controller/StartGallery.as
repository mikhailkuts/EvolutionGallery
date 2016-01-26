/**
 * Created by kuts on 1/26/16.
 */
package controller {

import robotlegs.bender.extensions.commandCenter.api.ICommand;
import robotlegs.bender.extensions.contextView.ContextView;

import view.gallery.GalleryView;

public class StartGallery implements ICommand {

	[Inject]
	public var contextView			:ContextView;

	public function execute():void
	{
		contextView.view.addChild(new GalleryView());
	}

}
}
