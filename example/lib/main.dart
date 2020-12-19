import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nigerian_banks/nigerian_banks.dart';
import 'package:nigerian_banks/utils/test/selector_config.dart';
import 'package:nigerian_banks/widget/banks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  BankModel bankModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Banks(
            onInputChanged: (BankModel b)=>print(b.name),
            selectorConfig: SelectorConfig(selectorType: BankInputSelectorType.BOTTOM_SHEET, showLogo: true, showCode: false),
          ),
        ),
      ),
    );
  }
}
