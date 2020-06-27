import 'package:Look/backmain.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class Back_run {
  void start() {
    var channel = const MethodChannel('com.example/background_service');
    var callbackHandle = PluginUtilities.getCallbackHandle(backgroundMain);
    channel.invokeMethod('startService', callbackHandle.toRawHandle());
  }
}
