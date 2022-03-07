import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:postcode/zip_code.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FindZipScreen extends StatefulWidget {
  const FindZipScreen({Key? key}) : super(key: key);

  @override
  State<FindZipScreen> createState() => _FindZipScreenState();
}

class _FindZipScreenState extends State<FindZipScreen> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: WebView(
        initialUrl: 'https://json-kim.github.io/webview-zipcode/',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
            name: 'zipcode',
            onMessageReceived: (JavascriptMessage message) {
              Map<String, dynamic> json = jsonDecode(message.message);
              ZipCode zipCode = ZipCode.fromJson(json);

              // 결과 전달
              Navigator.pop(context, zipCode);
            },
          ),
        },
      ),
    );
  }
}
