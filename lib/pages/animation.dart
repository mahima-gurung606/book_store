import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        height: 400,
        width: double.infinity, // Adjust width as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Lottie.asset('assets/animations/kadrim.json'),
      ),
    );
  }
}
