import 'package:ecmpplugin/ecmpplugin.dart';
import 'package:flutter/material.dart';

import 'product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _ecmpPlugin = EcmpPlugin();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductDetailsPage(),
    );
  }
}
