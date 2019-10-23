import 'dart:ffi' as ffi;
import '../utils/dylib.dart';

const String LIBRARY_NAME='flutter_jsc';

ffi.DynamicLibrary lib = DynamicLibraryHelp.load(LIBRARY_NAME);
