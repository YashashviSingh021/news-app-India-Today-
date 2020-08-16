import 'dart:async';


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticleView extends StatefulWidget {
  final String blogUrl;

  ArticleView({this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'India',
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
            ),
            //SizedBox(width: 8,),
            Text(
              'Today',
              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: <Widget>[

          Opacity(
            opacity: 0,
            child: Container(padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
