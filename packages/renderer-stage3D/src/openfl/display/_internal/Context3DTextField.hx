package openfl.display._internal;

#if openfl_gl
import openfl.display._internal.CairoTextField;
import openfl.display._internal.CanvasTextField;
import openfl.text.TextField;

#if !openfl_debug
@:fileXml(' tags="haxe,release" ')
@:noDebug
#end
@:access(openfl.display.Graphics)
@:access(openfl.text.TextField)
@SuppressWarnings("checkstyle:FieldDocComment")
class Context3DTextField
{
	public static function render(textField:TextField, renderer:Context3DRenderer):Void
	{
		#if openfl_html5
		CanvasTextField.render(textField, cast renderer._.__softwareRenderer, textField._.__worldTransform);
		#elseif openfl_cairo
		CairoTextField.render(textField, cast renderer._.__softwareRenderer, textField._.__worldTransform);
		#end
		textField._.__graphics._.__hardwareDirty = false;
	}

	public static function renderMask(textField:TextField, renderer:Context3DRenderer):Void
	{
		#if openfl_html5
		CanvasTextField.render(textField, cast renderer._.__softwareRenderer, textField._.__worldTransform);
		#elseif openfl_cairo
		CairoTextField.render(textField, cast renderer._.__softwareRenderer, textField._.__worldTransform);
		#end
		textField._.__graphics._.__hardwareDirty = false;
	}
}
#end
