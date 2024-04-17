import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecmpplugin/ecmpplugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelEcmpPlugin platform = MethodChannelEcmpPlugin();
  const MethodChannel channel = MethodChannel('ecmpplugin');

  setUp(() {

  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

}
