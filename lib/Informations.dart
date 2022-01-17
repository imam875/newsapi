import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class inform extends StatefulWidget {
  String url;
  inform(this.url);

  @override
  _informState createState() => _informState();
}
class _informState extends State<inform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
      body: WebView(
        initialUrl:widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),

    );;
  }
}
