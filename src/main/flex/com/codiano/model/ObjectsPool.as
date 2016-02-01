/**
 * Created by kuts on 1/27/16.
 */
package com.codiano.model {

import org.kissmyas.utils.loanshark.LoanShark;

import com.codiano.view.gallery.image.GallerySprite;

public class ObjectsPool {

	public static var gallerySpritesPool	:LoanShark 		= new LoanShark(GallerySprite);

}
}
