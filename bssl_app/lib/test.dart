// import 'dart:io';
// import 'package:flutter/material.dart';
// // import 'package:webview_flutter/webview_flutter.dart';

// class WebPageScreen extends StatefulWidget {
//   final String url;

//   WebPageScreen({required this.url});

//   @override
//   _WebPageScreenState createState() => _WebPageScreenState();
// }

// class _WebPageScreenState extends State<WebPageScreen> {
//   @override
//   void initState() {
//     super.initState();
//     if (Platform.isAndroid) {
//       WebView.platform = SurfaceAndroidWebView();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Web Page'),
//       ),
//       body: const WebView(
//         initialUrl: widget.url,
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
