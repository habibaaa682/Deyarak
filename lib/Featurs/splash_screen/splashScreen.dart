import 'package:deyarakapp/Featurs/splash_screen/building_animation/building_animation.dart';
import 'package:deyarakapp/Featurs/splash_screen/deyark_animation/deyarak_text.dart';

import 'package:deyarakapp/Featurs/splash_screen/roof_Animation/roof_Animation.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class screen_splash extends StatefulWidget {
  const screen_splash({Key? key}) : super(key: key);

  @override
  State<screen_splash> createState() => _screen_splashState();
}

class _screen_splashState extends State<screen_splash> {
  @override
  void initState() {
    super.initState();
    trans_to_login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          roof_animation(),
          deyarka_text(),
          building_animation(),
        ],
      ),
    );
  }

  void trans_to_login() {
    Future.delayed(const Duration(seconds: 7), () {
      navigateUser();
    });
  }

  void navigateUser() async {
     prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
    if (status) {
      GoRouter.of(context).push(AppRouter.khome);
    } else {
      GoRouter.of(context).push(AppRouter.kwelcome);
    }
  }
}
