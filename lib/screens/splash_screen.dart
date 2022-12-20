import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splash_screen/background.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          AnimatedSplashScreen(
            duration: 3000,
            backgroundColor: Colors.transparent,
            nextScreen: Home(),
            splashTransition: SplashTransition.sizeTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            splashIconSize: double.maxFinite,
            splash: Center(
              child: Image.asset(
                'assets/splash_screen/logo.png',
                width: 239,
                height: 239,
              ),
            ),
          ),
        ],
      )
    );
  }
}
