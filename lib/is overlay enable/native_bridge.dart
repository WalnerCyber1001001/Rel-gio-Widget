import 'dart:ffi';
import 'dart:io';

typedef SetAlwaysOnTopNative = Void Function(IntPtr hwnd, Bool isEnabled);
typedef SetAlwaysOnTopDart = void Function(int hwnd, bool isEnabled);

class AlwaysOnTop {
  late final DynamicLibrary _library;
  late final SetAlwaysOnTopDart _setAlwaysOnTop;

  AlwaysOnTop() {
    _library = DynamicLibrary.open(
      Platform.isWindows ? 'always_on_top.dll' : throw UnsupportedError('Unsupported platform'),
    );

    _setAlwaysOnTop = _library
        .lookup<NativeFunction<SetAlwaysOnTopNative>>('SetAlwaysOnTop')
        .asFunction();
  }

  void setAlwaysOnTop(int hwnd, bool isEnabled) {
    _setAlwaysOnTop(hwnd, isEnabled);
  }
}