import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class VibrateModel extends ChangeNotifier {
  bool _isVibrate = true;
  late Timer _timer;

  void _onVibrate(Timer timer) async {
    Vibration.vibrate(duration: 1000, amplitude: 255);
    await Future.delayed(Duration(milliseconds: 500));
    Vibration.cancel();
  }

  void stopVibrate() {
    _timer.cancel();
    _isVibrate = false;
  }

  void startVibrate() {
    _timer = Timer.periodic(Duration(seconds: 1), _onVibrate);
  }

  @override
  void dispose() {
    if (!_isVibrate) {
      _timer.cancel();
    }
    super.dispose();
  }
}
