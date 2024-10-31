import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
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
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://www.freeprivacypolicy.com/live/7eb654dc-5c8b-4a77-95e3-14bafc724e3c'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms and Conditions')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
