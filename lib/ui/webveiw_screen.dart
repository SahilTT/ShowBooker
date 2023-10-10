import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  static const String id = "webview_screen";

  String? url;

  WebviewScreen({super.key, this.url});

  @override
  _WebviewScreenState createState() => _WebviewScreenState(url: url);

}

class _WebviewScreenState extends State<WebviewScreen> {

  String? url;

  _WebviewScreenState({this.url});

  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(url!));
    controller.setNavigationDelegate(NavigationDelegate(
      onPageStarted: (String url) {
        print("On Page load Start");
      },
      onPageFinished: (String url) {
        print("On Page load end");
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Container(
            padding: EdgeInsets.only(top: context.resources.dimension.defaultVerticalMargin),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.vertical - context.resources.dimension.defaultVerticalMargin,
                  child: WebViewWidget(
                    controller: controller,
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
