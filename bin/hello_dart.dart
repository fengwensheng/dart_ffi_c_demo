import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;

// void hello();
//用dart:ffi提供的NativeType对应类型
typedef HelloNative = Int32 Function();
//用dart提供的基础类型和dart:ffi提供的NativeType
typedef HelloDart = int Function();
void main(List<String> arguments) {
  //load dynamic lib, project root path
  var dy = DynamicLibrary.open('libhello.a');
  //c -> ffi:NativeType -> dart
  HelloDart helloDart = dy.lookupFunction<HelloNative, HelloDart>('hello');
  helloDart();
}
