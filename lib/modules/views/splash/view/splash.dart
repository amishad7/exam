import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  toNext() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed('/splash2');
    });
  }

  @override
  Widget build(BuildContext context) {
    toNext();

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              child: Container(
                alignment: Alignment.center,
                height: Get.height / 8,
                width: Get.width / 1.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: const Text(
                  "CHAT KIT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 565, left: 155),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
