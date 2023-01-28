import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebScreen extends StatelessWidget {
    WebScreen({required this.url}) ;
   var  url ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
       body:InAppWebView(initialUrlRequest:URLRequest(url: Uri.parse(url)) ),
    );
  }
}
