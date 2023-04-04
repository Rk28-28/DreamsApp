import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';


class MyWebView extends StatefulWidget {
  final String url;

  MyWebView({required this.url});

  @override
  _MyWebViewState createState() => _MyWebViewState(url);
}

class _MyWebViewState extends State<MyWebView> {
String link ='';
  _MyWebViewState(String url){
link = url;
} //String get url => widget.url;

  WebViewController _controller = WebViewController()

  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(

    NavigationDelegate(
        onProgress: (int progress) {
  // Update loading bar.
       },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
    ),
  )
  ..loadRequest(Uri.parse('https://www.cdc.gov/sleep/about_sleep/sleep_hygiene.html'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My WebView'),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
