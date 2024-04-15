import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView2 extends StatelessWidget {
  const SplashView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            width: Get.width / 1.2,
            height: Get.height / 8,
            decoration: BoxDecoration(
              color: const Color(0xfff48757),
              // image: const DecorationImage(
              //   fit: BoxFit.cover,
              //   opacity: 0.5,
              //   image: NetworkImage(
              //     'https://i.pinimg.com/564x/b6/c3/a3/b6c3a36f3c37b23bd2002e3f9daaa5cc.jpg',
              //   ),
              // ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "ADD YOUR FAVORITES",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: Get.width / 1.4,
            height: Get.height / 8,
            decoration: BoxDecoration(
              color: const Color(0xfff48757),
              // image: const DecorationImage(
              //   fit: BoxFit.cover,
              //   opacity: 0.5,
              //   image: NetworkImage(
              //     'https://i.pinimg.com/564x/b6/c3/a3/b6c3a36f3c37b23bd2002e3f9daaa5cc.jpg',
              //   ),
              // ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "TEXT MORE PEOPLE",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Center(
            child: Text(
              "Find your friends..",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              fixedSize: const Size(275, 45),
              backgroundColor: const Color(0xfff48757),
            ),
            onPressed: () {
              log("tapped");
              Get.offAndToNamed("/signup");
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
