import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashWrapper(),
    );
  }
}

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  late final WebViewController _controller;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000)) // 🔥 no black bg
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            setState(() => _isLoaded = true);
          },
        ),
      )
      ..loadRequest(
        Uri.parse("https://payhello.netlify.app/"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // WebView (loads in background)
          WebViewWidget(controller: _controller),

          // Splash overlay (hide after load)
          if (!_isLoaded)
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/lottie/splash.json',
                width: 200,
              ),
            ),
        ],
      ),
    );
  }
}
