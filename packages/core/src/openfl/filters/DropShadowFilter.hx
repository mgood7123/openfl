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
	The DropShadowFilter class lets you add a drop shadow to display objects.
	The shadow algorithm is based on the same box filter that the blur filter
	uses. You have several options for the style of the drop shadow, including
	inner or outer shadow and knockout mode. You can apply the filter to any
	display object(that is, objects that inherit from the DisplayObject
	class), such as MovieClip, SimpleButton, TextField, and Video objects, as
	well as to BitmapData objects.

	The use of filters depends on the object to which you apply the
	filter:


	* To apply filters to display objects use the `filters`
	property(inherited from DisplayObject). Setting the `filters`
	property of an object does not modify the object, and you can remove the
	filter by clearing the `filters` property.
	* To apply filters to BitmapData objects, use the
	`BitmapData.applyFilter()` method. Calling
	`applyFilter()` on a BitmapData object takes the source
	BitmapData object and the filter object and generates a filtered image as a
	result.


	If you apply a filter to a display object, the value of the
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
	limitation is 2,880 pixels in height and 2,880 pixels in width. If, for
	example, you zoom in on a large movie clip with a filter applied, the
	filter is turned off if the resulting image exceeds the maximum
	dimensions.
**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@:access(openfl.filters.GlowFilter)
@:access(openfl.geom.ColorTransform)
@:access(openfl.geom.Point)
@:access(openfl.geom.Rectangle)
@:final class DropShadowFilter extends BitmapFilter
{
	/**
		The alpha transparency value for the shadow color. Valid values are 0.0 to
		1.0. For example, .25 sets a transparency value of 25%. The default value
		is 1.0.
	**/
	public var alpha(get, set):Float;

	/**
		The angle of the shadow. Valid values are 0 to 360 degrees(floating
		point). The default value is 45.
	**/
	public var angle(get, set):Float;

	/**
		The amount of horizontal blur. Valid values are 0 to 255.0(floating
		point). The default value is 4.0.
	**/
	public var blurX(get, set):Float;

	/**
		The amount of vertical blur. Valid values are 0 to 255.0(floating point).
		The default value is 4.0.
	**/
	public var blurY(get, set):Float;

	/**
		The color of the shadow. Valid values are in hexadecimal format
		_0xRRGGBB_. The default value is 0x000000.
	**/
	public var color(get, set):Int;

	/**
		The offset distance for the shadow, in pixels. The default value is 4.0
		(floating point).
	**/
	public var distance(get, set):Float;

	/**
		Indicates whether or not the object is hidden. The value `true`
		indicates that the object itself is not drawn; only the shadow is visible.
		The default is `false`(the object is shown).
	**/
	public var hideObject(get, set):Bool;

	/**
		Indicates whether or not the shadow is an inner shadow. The value
		`true` indicates an inner shadow. The default is
		`false`, an outer shadow(a shadow around the outer edges of
		the object).
	**/
	public var inner(get, set):Bool;

	/**
		Applies a knockout effect(`true`), which effectively makes the
		object's fill transparent and reveals the background color of the
		document. The default is `false`(no knockout).
	**/
	public var knockout(get, set):Bool;

	/**
		The number of times to apply the filter. The default value is
		`BitmapFilterQuality.LOW`, which is equivalent to applying the
		filter once. The value `BitmapFilterQuality.MEDIUM` applies the
		filter twice; the value `BitmapFilterQuality.HIGH` applies it
		three times. Filters with lower values are rendered more quickly.

		For most applications, a quality value of low, medium, or high is
		sufficient. Although you can use additional numeric values up to 15 to
		achieve different effects, higher values are rendered more slowly. Instead
		of increasing the value of `quality`, you can often get a
		similar effect, and with faster rendering, by simply increasing the values
		of the `blurX` and `blurY` properties.
	**/
	public var quality(get, set):Int;

	/**
		The strength of the imprint or spread. The higher the value, the more
		color is imprinted and the stronger the contrast between the shadow and
		the background. Valid values are from 0 to 255.0. The default is 1.0.
	**/
	public var strength(get, set):Float;

	/**
		Creates a new DropShadowFilter instance with the specified parameters.

		@param distance   Offset distance for the shadow, in pixels.
		@param angle      Angle of the shadow, 0 to 360 degrees(floating point).
		@param color      Color of the shadow, in hexadecimal format
						  _0xRRGGBB_. The default value is 0x000000.
		@param alpha      Alpha transparency value for the shadow color. Valid
						  values are 0.0 to 1.0. For example, .25 sets a
						  transparency value of 25%.
		@param blurX      Amount of horizontal blur. Valid values are 0 to 255.0
						 (floating point).
		@param blurY      Amount of vertical blur. Valid values are 0 to 255.0
						 (floating point).
		@param strength   The strength of the imprint or spread. The higher the
						  value, the more color is imprinted and the stronger the
						  contrast between the shadow and the background. Valid
						  values are 0 to 255.0.
		@param quality    The number of times to apply the filter. Use the
						  BitmapFilterQuality constants:

						   * `BitmapFilterQuality.LOW`
						   * `BitmapFilterQuality.MEDIUM`
						   * `BitmapFilterQuality.HIGH`


						  For more information about these values, see the
						  `quality` property description.
		@param inner      Indicates whether or not the shadow is an inner shadow.
						  A value of `true` specifies an inner shadow.
						  A value of `false` specifies an outer shadow
						 (a shadow around the outer edges of the object).
		@param knockout   Applies a knockout effect(`true`), which
						  effectively makes the object's fill transparent and
						  reveals the background color of the document.
		@param hideObject Indicates whether or not the object is hidden. A value
						  of `true` indicates that the object itself is
						  not drawn; only the shadow is visible.
	**/
	public function new(distance:Float = 4, angle:Float = 45, color:Int = 0, alpha:Float = 1, blurX:Float = 4, blurY:Float = 4, strength:Float = 1,
			quality:Int = 1, inner:Bool = false, knockout:Bool = false, hideObject:Bool = false)
	{
		_ = new _DropShadowFilter(distance, angle, color, alpha, blurX, blurY, strength, quality, inner, knockout, hideObject);

		super();
	}

	public override function clone():DropShadowFilter
	{
		return (_ : _DropShadowFilter).clone();
	}

	// Get & Set Methods

	@:noCompletion private function get_alpha():Float
	{
		return (_ : _DropShadowFilter).alpha;
	}

	@:noCompletion private function set_alpha(value:Float):Float
	{
		return (_ : _DropShadowFilter).alpha = value;
	}

	@:noCompletion private function get_angle():Float
	{
		return (_ : _DropShadowFilter).angle;
	}

	@:noCompletion private function set_angle(value:Float):Float
	{
		return (_ : _DropShadowFilter).angle = value;
	}

	@:noCompletion private function get_blurX():Float
	{
		return (_ : _DropShadowFilter).blurX;
	}

	@:noCompletion private function set_blurX(value:Float):Float
	{
		return (_ : _DropShadowFilter).blurX = value;
	}

	@:noCompletion private function get_blurY():Float
	{
		return (_ : _DropShadowFilter).blurY;
	}

	@:noCompletion private function set_blurY(value:Float):Float
	{
		return (_ : _DropShadowFilter).blurY = value;
	}

	@:noCompletion private function get_color():Int
	{
		return (_ : _DropShadowFilter).color;
	}

	@:noCompletion private function set_color(value:Int):Int
	{
		return (_ : _DropShadowFilter).color = value;
	}

	@:noCompletion private function get_distance():Float
	{
		return (_ : _DropShadowFilter).distance;
	}

	@:noCompletion private function set_distance(value:Float):Float
	{
		return (_ : _DropShadowFilter).distance = value;
	}

	@:noCompletion private function get_hideObject():Bool
	{
		return (_ : _DropShadowFilter).hideObject;
	}

	@:noCompletion private function set_hideObject(value:Bool):Bool
	{
		return (_ : _DropShadowFilter).hideObject = value;
	}

	@:noCompletion private function get_inner():Bool
	{
		return (_ : _DropShadowFilter).inner;
	}

	@:noCompletion private function set_inner(value:Bool):Bool
	{
		return (_ : _DropShadowFilter).inner = value;
	}

	@:noCompletion private function get_knockout():Bool
	{
		return (_ : _DropShadowFilter).knockout;
	}

	@:noCompletion private function set_knockout(value:Bool):Bool
	{
		return (_ : _DropShadowFilter).knockout = value;
	}

	@:noCompletion private function get_quality():Int
	{
		return (_ : _DropShadowFilter).quality;
	}

	@:noCompletion private function set_quality(value:Int):Int
	{
		return (_ : _DropShadowFilter).quality = value;
	}

	@:noCompletion private function get_strength():Float
	{
		return (_ : _DropShadowFilter).strength;
	}

	@:noCompletion private function set_strength(value:Float):Float
	{
		return (_ : _DropShadowFilter).strength = value;
	}
}
#else
typedef DropShadowFilter = flash.filters.DropShadowFilter;
#end
