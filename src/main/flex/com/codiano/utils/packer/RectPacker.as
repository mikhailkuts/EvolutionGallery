/**
 * Created by kuts on 1/29/16.
 */
package com.codiano.utils.packer {

public class RectPacker {

	public static const CLOSENESS_STEP			:Number 	= 0.1;
	public static const RADIAL_STEP				:int 		= 10;

	public function pack(area:PackerRect, rects:Vector.<PackerRect>):Vector.<PackerRect>
	{
		var placedRects:Vector.<PackerRect> = new <PackerRect>[];
		var unplaced:uint = 0;
		var placedRect:PackerRect;

		for (var i:uint = 0; i < rects.length; i++)
		{
			placedRect = placeRect(rects[i], placedRects, area);

			if (placedRect == null)
				++unplaced;
			else
				placedRects.push(placedRect);
		}

		return placedRects;
	}

	public function placeRect(rect:PackerRect, placedRects:Vector.<PackerRect>, area:PackerRect):PackerRect
	{
		if (checkRectWithinArea(rect, area) && !checkCollisions(rect, placedRects))
			return rect;

		var maxDistance:Number = Math.sqrt(area.width * area.width + area.height * area.height) * 0.5;
		var rotationOffset:Number = Math.random() * 360;
		var newRect:PackerRect = rect.clone();

		newRect.originalX = rect.x;
		newRect.originalY = rect.y;

		for (var currentRadius:Number = rect.size * CLOSENESS_STEP;
			 currentRadius < maxDistance;
			 currentRadius += rect.size * CLOSENESS_STEP)
		{
			for (var rotation:Number = 0; rotation < 360; rotation += RADIAL_STEP)
			{
				var dx:Number = Math.cos(rotationOffset + rotation * (Math.PI/180)) * currentRadius;
				var dy:Number = Math.sin(rotationOffset + rotation * (Math.PI/180)) * currentRadius;

				newRect.x = rect.x + dx;
				newRect.y = rect.y + dy;

				newRect.calculateBounds();

				if (checkRectWithinArea(newRect, area) && !checkCollisions(newRect, placedRects))
					return newRect;
			}
		}

		return null;
	}

	public function checkCollisions(rect:PackerRect, placedRects:Vector.<PackerRect>):Boolean
	{
		for each (var placedRect:PackerRect in placedRects)
		{
			if (!(	placedRect.left > rect.right ||
					placedRect.right < rect.left ||
					placedRect.top > rect.bottom ||
					placedRect.bottom < rect.top
				) && rect !== placedRect)
				return true;
		}

		return false;
	}

	public function checkRectWithinArea(rect:PackerRect, area:PackerRect):Boolean
	{
		return 	rect.left > area.left &&
				rect.right < area.right &&
				rect.top > area.top &&
				rect.bottom < area.bottom;
	}

}
}
