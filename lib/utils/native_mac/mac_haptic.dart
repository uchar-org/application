import 'package:flutter/services.dart';

class MacHaptic {
  static const _channel = MethodChannel('mac_haptic');

  static Future<void> lightImpact() async {
    try {
      await _channel.invokeMethod('lightImpact');
    } catch (_) {}
  }
}