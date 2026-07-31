import 'package:flutter/material.dart';
import 'package:premium_coffee_app/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (c) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffeb60d),
      body: Column(
        children: [
          SizedBox(height: 50),
          Image.asset("assets/logo/logo.png", width: 420),
        ],
      ),
    );
  }
}
