import 'ecmpplugin_platform_interface.dart';
import 'models/ecmp_payment_info.dart';
import 'models/ecmp_payment_options.dart';
import 'models/ecmp_plugin_result.dart';

class EcmpPlugin {
  Future<EcmpPluginResult?> sdkRun(EcmpPaymentOptions options) {
    return EcmpPluginPlatform.instance.sdkRun(options);
  }

  Future<String?> getParamsForSignature(EcmpPaymentInfo paymentInfo) {
    return EcmpPluginPlatform.instance.getParamsForSignature(paymentInfo);
  }
}
