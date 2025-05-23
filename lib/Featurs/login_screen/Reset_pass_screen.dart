import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';

import 'package:deyarakapp/Featurs/register_screen/widget/TextFieldInput.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/controllers/registeration_controller.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:deyarakapp/core/utils/router.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';

import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  ResetPasswordScreen({super.key});

  get querywidth => null;

  get queryheight => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, size: 28),
      ),
      body: ListView(physics: NeverScrollableScrollPhysics(), children: [
        Image.asset(
          'assets/images/refresh.png',
          width: MediaQuery.of(context).size.width * .2,
          height: MediaQuery.of(context).size.height * .25,
        ),
        const SizedBox(
          height: 80,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .6,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFF725E), Color(0xffDF8256)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forget Password',
                    style: Fonts.textstyle30.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your email for the verification process,we will send a link to your email',
                    maxLines: 2,
                    style: Fonts.textstyle14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFieldInputt(
                  textEditingController:
                      registerationController.passwordController,
                  text: 'Email',
                  colorr: Colors.white,
                  function: () {},
                  icon: Icons.person,
                  formatter: [],
                  password: false,

                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .57,
                    height: MediaQuery.of(context).size.height * .06,
                    child: Button(
                        text: 'Reset',
                        ontap: () {
                          GoRouter.of(context)
                              .push(AppRouter.kconfirmnewpassword);
                        },
                        raduis: 24,
                        colorr: Colors.white,
                        width: 150,
                        marginn: 0,
                        height: 100,
                        textcolor: kprimarycolor))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
