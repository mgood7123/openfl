package openfl.filters;

#if !flash
import openfl.display.BitmapData;
import openfl.display.DisplayObjectRenderer;
import openfl.display.Shader;
import openfl.geom.ColorTransform;
import openfl.geom.Point;
import openfl.geom.Rectangle;
#if lime
import lime._internal.graphics.ImageDataUtil;
#else
import openfl._internal.backend.lime_standalone.ImageDataUtil;
#end

/**
	The GlowFilter class lets you apply a glow effect to display objects. You
	have several options for the style of the glow, including inner or outer
	glow and knockout mode. The glow filter is similar to the drop shadow
	filter with the `distance` and `angle` properties of
	the drop shadow filter set to 0. You can apply the filter to any display
	object(that is, objects that inherit from the DisplayObject class), such
	as MovieClip, SimpleButton, TextField, and Video objects, as well as to
	BitmapData objects.

	The use of filters depends on the object to which you apply the
	filter:


	* To apply filters to display objects, use the `filters`
	property(inherited from DisplayObject). Setting the `filters`
	property of an object does not modify the object, and you can remove the
	filter by clearing the `filters` property.
	* To apply filters to BitmapData objects, use the
	`BitmapData.applyFilter()` method. Calling
	`applyFilter()` on a BitmapData object takes the source
	BitmapData object and the filter object and generates a filtered image as a
	result.


	If you apply a filter to a display object, the
	`cacheAsBitmap` property of the display object is set to
	`true`. If you clear all filters, the original value of
	`cacheAsBitmap` is restored.

	This filter supports Stage scaling. However, it does not support general
	scaling, rotation, and skewing. If the object itself is scaled(if
	`scaleX` and `scaleY` are set to a value other than
	1.0), the filter is not scaled. It is scaled only when the user zooms in on
	the Stage.

	A filter is not applied if the resulting image exceeds the maximum
	dimensions. In AIR 1.5 and Flash Player 10, the maximum is 8,191 pixels in
	width or height, and the total number of pixels cannot exceed 16,777,215
	pixels.(So, if an image is 8,191 pixels wide, it can only be 2,048 pixels
	high.) In Flash Player 9 and earlier and AIR 1.1 and earlier, the
	limitation is 2,880 pixels in height and 2,880 pixels in width. For
	example, if you zoom in on a large movie clip with a filter applied, the
	filter is turned off if the resulting image exceeds the maximum
	dimensions.
**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:final class GlowFilter extends BitmapFilter
{
	/**
		The alpha transparency value for the color. Valid values are 0 to 1. For
		example, .25 sets a transparency value of 25%. The default value is 1.
	**/
	public var alpha(get, set):Float;

	/**
		The amount of horizontal blur. Valid values are 0 to 255(floating point).
		The default value is 6. Values that are a power of 2(such as 2, 4, 8, 16,
		and 32) are optimized to render more quickly than other values.
	**/
	public var blurX(get, set):Float;

	/**
		The amount of vertical blur. Valid values are 0 to 255(floating point).
		The default value is 6. Values that are a power of 2(such as 2, 4, 8, 16,
		and 32) are optimized to render more quickly than other values.
	**/
	public var blurY(get, set):Float;

	/**
		The color of the glow. Valid values are in the hexadecimal format
		0x_RRGGBB_. The default value is 0xFF0000.
	**/
	public var color(get, set):Int;

	/**
		Specifies whether the glow is an inner glow. The value `true`
		indicates an inner glow. The default is `false`, an outer glow
		(a glow around the outer edges of the object).
	**/
	public var inner(get, set):Bool;

	/**
		Specifies whether the object has a knockout effect. A value of
		`true` makes the object's fill transparent and reveals the
		background color of the document. The default value is `false`
		(no knockout effect).
	**/
	public var knockout(get, set):Bool;

	/**
		The number of times to apply the filter. The default value is
		`BitmapFilterQuality.LOW`, which is equivalent to applying the
		filter once. The value `BitmapFilterQuality.MEDIUM` applies the
		filter twice; the value `BitmapFilterQuality.HIGH` applies it
		three times. Filters with lower values are rendered more quickly.

		For most applications, a `quality` value of low, medium, or
		high is sufficient. Although you can use additional numeric values up to
		15 to achieve different effects, higher values are rendered more slowly.
		Instead of increasing the value of `quality`, you can often get
		a similar effect, and with faster rendering, by simply increasing the
		values of the `blurX` and `blurY` properties.
	**/
	public var quality(get, set):Int;

	/**
		The strength of the imprint or spread. The higher the value, the more
		color is imprinted and the stronger the contrast between the glow and the
		background. Valid values are 0 to 255. The default is 2.
	**/
	public var strength(get, set):Float;

	public function new(color:Int = 0xFF0000, alpha:Float = 1, blurX:Float = 6, blurY:Float = 6, strength:Float = 2, quality:Int = 1, inner:Bool = false,
			knockout:Bool = false)
	{
		_ = new _GlowFilter(color, alpha, blurX, blurY, strength, quality, inner, knockout);

		super();
	}

	public override function clone():GlowFilter
	{
		return (_ : _GlowFilter).clone();
	}

	// Get & Set Methods

	@:noCompletion private function get_alpha():Float
	{
		return (_ : _GlowFilter).alpha;
	}

	@:noCompletion private function set_alpha(value:Float):Float
	{
		return (_ : _GlowFilter).alpha = value;
	}

	@:noCompletion private function get_blurX():Float
	{
		return (_ : _GlowFilter).blurX;
	}

	@:noCompletion private function set_blurX(value:Float):Float
	{
		return (_ : _GlowFilter).blurX = value;
	}

	@:noCompletion private function get_blurY():Float
	{
		return (_ : _GlowFilter).blurY;
	}

	@:noCompletion private function set_blurY(value:Float):Float
	{
		return (_ : _GlowFilter).blurY = value;
	}

	@:noCompletion private function get_color():Int
	{
		return (_ : _GlowFilter).color;
	}

	@:noCompletion private function set_color(value:Int):Int
	{
		return (_ : _GlowFilter).color = value;
	}

	@:noCompletion private function get_inner():Bool
	{
		return (_ : _GlowFilter).inner;
	}

	@:noCompletion private function set_inner(value:Bool):Bool
	{
		return (_ : _GlowFilter).inner = value;
	}

	@:noCompletion private function get_knockout():Bool
	{
		return (_ : _GlowFilter).knockout;
	}

	@:noCompletion private function set_knockout(value:Bool):Bool
	{
		return (_ : _GlowFilter).knockout = value;
	}

	@:noCompletion private function get_quality():Int
	{
		return (_ : _GlowFilter).quality;
	}

	@:noCompletion private function set_quality(value:Int):Int
	{
		return (_ : _GlowFilter).quality = value;
	}

	@:noCompletion private function get_strength():Float
	{
		return (_ : _GlowFilter).strength;
	}

	@:noCompletion private function set_strength(value:Float):Float
	{
		return (_ : _GlowFilter).strength = value;
	}
}
#else
typedef GlowFilter = flash.filters.GlowFilter;
#end
