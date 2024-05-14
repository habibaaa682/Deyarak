import 'package:deyarakapp/Featurs/login_screen/CreateAccount_Text.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/Featurs/register_screen/widget/TextFieldInput.dart';

import 'package:deyarakapp/constants.dart';

import 'package:deyarakapp/controllers/registeration_controller.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    var queryheight = MediaQuery.of(context).size.height;
    var querywidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image.asset('assets/pics/houseSearch.png'),
          Container(
            padding: EdgeInsets.only(
                top: queryheight / 40, bottom: queryheight / 20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffFF725E), Color(0xffDF8256)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              children: [
                TextFieldInputt(
                  textEditingController: registerationController.nameController,
                  text: 'User Name',
                  icon: Icons.person,
                  function: () {},
                  colorr: Colors.white,
                  formatter: [],
                  password: false,

                ),
                SizedBox(
                  height: queryheight / 45,
                ),
                TextFieldInputt(
                  textEditingController:
                      registerationController.phoneController,
                  text: 'Mobile Number',
                  icon: Icons.phone,
                  keybordtype: TextInputType.phone,
                  function: () {},
                  colorr: Colors.white,
                  formatter: [FilteringTextInputFormatter.digitsOnly],
                  password: false,

                ),
                SizedBox(
                  height: queryheight / 45,
                ),
                TextFieldInputt(
                  textEditingController:
                      registerationController.emailController,
                  text: 'Email',
                  icon: Icons.mail,
                  function: () {},
                  colorr: Colors.white,
                  formatter: [],
                  keybordtype: TextInputType.emailAddress,
                  password: false,


                ),
                SizedBox(
                  height: queryheight / 45,
                ),
                TextFieldInputt(
                  textEditingController:
                      registerationController.passwordController,
                  text: 'Password',
                  icon: Icons.lock,
                  function: () {},
                  colorr: Colors.white,
                  formatter: [],
                  password: true,


                ),
                SizedBox(
                  height: queryheight / 45,
                ),
                TextFieldInputt(
                  textEditingController:
                      registerationController.passwordConfirmController,
                  text: 'Confirm Password',
                  icon: Icons.lock,
                  function: () {},
                  colorr: Colors.white,
                  formatter: [],
                  password: true,


                ),
                SizedBox(
                  height: queryheight / 20,
                ),
                Button(
                  text: 'Sign UP',
                  ontap: () async {
                    registerationController.registerWithEmail(context);
                     prefs = await SharedPreferences.getInstance();
                    prefs?.setBool("isLoggedIn", true);
                  },
                  raduis: 35,
                  colorr: Colors.white,
                  width: querywidth / 235,
                  marginn: 0,
                  height: queryheight / 37,
                  textcolor: kprimarycolor,
                ),
                SizedBox(
                  height: queryheight / 20,
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.klogin);
                  },
                  child: Create_account_text(
                    text1: 'Already have an account?',
                    text2: '  login now',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
