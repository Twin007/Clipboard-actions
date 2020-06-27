import 'dart:io';
import 'package:Look/show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Start extends StatelessWidget {
  const Start({
    Key key,
  }) : super(key: key);

  final _channel = const MethodChannel('com.example/app_retain');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isAndroid) {
          if (Navigator.of(context).canPop()) {
            return true;
          } else {
            _channel.invokeMethod('sendToBackground');
            return false;
          }
        } else {
          return true;
        }
      },
      child: Feed(),
    );
  }
}
