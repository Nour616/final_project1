import 'package:final_project/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); 

    _opacityAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) { 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false, 

      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/backgroung.jpg"), 
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: const Text(
                    "SU",
                    style: TextStyle(
                      color: Color(0XFF172A3A),
                      fontSize: 274,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


