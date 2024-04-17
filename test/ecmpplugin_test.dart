import 'package:ecmpplugin/ecmpplugin_method_channel.dart';
import 'package:ecmpplugin/ecmpplugin_platform_interface.dart';
import 'package:ecmpplugin/models/ecmp_payment_info.dart';
import 'package:ecmpplugin/models/ecmp_payment_options.dart';
import 'package:ecmpplugin/models/ecmp_plugin_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEcmpPluginPlatform
    with MockPlatformInterfaceMixin
    implements EcmpPluginPlatform {
  @override
  Future<EcmpPluginResult?> sdkRun(EcmpPaymentOptions options) {
    return Future.value(null);
  }

  @override
  Future<String?> getParamsForSignature(EcmpPaymentInfo paymentInfo) {
    return Future.value(null);
  }
}

void main() {
  final EcmpPluginPlatform initialPlatform = EcmpPluginPlatform.instance;

  test('$MethodChannelEcmpPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEcmpPlugin>());
  });
}
