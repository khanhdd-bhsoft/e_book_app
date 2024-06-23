import 'package:e_book/core/customs/custom_back_icon.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  WebviewPage({super.key, required this.pageName, required this.url});
  String url;
  String pageName;

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  WebViewController controller = WebViewController();
  var loadingPercent = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initWebview();
  }

  Future<void> initWebview() async {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onWebResourceError: (error) {},
        onPageStarted: (url) {
          setState(() {
            loadingPercent = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercent = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercent = 100;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: CustomBackButton(),
          title: Text(
            widget.pageName,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          elevation: 5,
        ),
        body: SizedBox.expand(
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
