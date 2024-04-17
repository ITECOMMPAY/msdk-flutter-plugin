import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ecmpplugin_platform_interface.dart';
import 'models/ecmp_payment_info.dart';
import 'models/ecmp_payment_options.dart';
import 'models/ecmp_plugin_result.dart';

/// An implementation of [EcmpPluginPlatform] that uses method channels.
class MethodChannelEcmpPlugin extends EcmpPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ecmpplugin');

  @override
  Future<EcmpPluginResult?> sdkRun(EcmpPaymentOptions options) async {
    final responseJson =
        await methodChannel.invokeMethod<String>('sdkRun', jsonEncode(options));
    return responseJson != null
        ? EcmpPluginResult.fromJson(jsonDecode(responseJson))
        : null;
  }

  @override
  Future<String?> getParamsForSignature(EcmpPaymentInfo paymentInfo) async {
    return await methodChannel.invokeMethod<String>(
        'getParamsForSignature', jsonEncode(paymentInfo));
  }
}
