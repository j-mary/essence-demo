import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
// Reference to webview controller
  WebViewController? _controller;

  String pageContent = '';

  void handleCheckout() {
    final doc = parse(pageContent);
    final domContent = doc.getElementById('hplogo')?.attributes['alt'];
    log('DOM Content');
    log('$domContent');
  }

  Widget _buildWebViewContent() {
    return WebView(
      initialUrl: 'https://www.google.com',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        // Get reference to WebView controller to access it globally
        _controller = webViewController;
      },
      javascriptChannels: <JavascriptChannel>[
        // Set Javascript Channel to WebView
        _extractDataJSChannel(context),
      ].toSet(),
      onPageStarted: (String url) {
        log('Page started loading: $url');
      },
      onPageFinished: (String url) {
        log('Page finished loading: $url');
        // In the final result page we check the url to make sure  it is the last page.
        // if (url.contains('/finalresponse.html')) {
        _controller?.evaluateJavascript(
            "(function(){Flutter.postMessage(window.document.body.outerHTML)})();");
        // }
        // readJs();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Web View Example'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: _buildWebViewContent()),
            ElevatedButton(
              child: Text('Checkout'),
              onPressed: handleCheckout,
            ),
          ],
        ),
      ),
    );
  }

  // readJs() async {
  //   String? html = await _controller
  //       ?.evaluateJavascript("window.document.body.outerHTML;");
  //   log('html: $html');
  // }

  JavascriptChannel _extractDataJSChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Flutter',
      onMessageReceived: (JavascriptMessage message) {
        String pageBody = message.message;
        setState(() {
          pageContent = pageBody;
        });
        // log('page body: $pageBody');
      },
    );
  }
}
