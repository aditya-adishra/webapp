import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart'; // WebView wali screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Splash ke baad main app open hogi
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WebApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // apni branding ke hisaab se change kar sakte ho
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json',
          width: 220,
          repeat: false,
        ),
      ),
    );
  }
}
