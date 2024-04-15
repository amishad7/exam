import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/modules/views/home/view/home.dart';
import 'package:untitled1/modules/views/signup/view/signup.dart';
import 'package:untitled1/modules/views/splash/view/splash.dart';

import 'modules/views/splash2/view/splash.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashView(),
        ),
        GetPage(
          name: '/splash2',
          page: () => const SplashView2(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignUpView(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeView(),
        ),
      ],
    ),
  );
}
