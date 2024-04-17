import 'package:ecmpplugin/models/ecmp_payment_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ecmpplugin_method_channel.dart';
import 'models/ecmp_payment_options.dart';
import 'models/ecmp_plugin_result.dart';

abstract class EcmpPluginPlatform extends PlatformInterface {
  /// Constructs a EcmpPluginPlatform.
  EcmpPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static EcmpPluginPlatform _instance = MethodChannelEcmpPlugin();

  /// The default instance of [EcmpPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelEcmpPlugin].
  static EcmpPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EcmpPluginPlatform] when
  /// they register themselves.
  static set instance(EcmpPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<EcmpPluginResult?> sdkRun(EcmpPaymentOptions options) {
    return _instance.sdkRun(options);
  }

  Future<String?> getParamsForSignature(EcmpPaymentInfo paymentInfo) {
    return _instance.getParamsForSignature(paymentInfo);
  }
}
