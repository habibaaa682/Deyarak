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

class registerView extends StatelessWidget {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  registerView({super.key});
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
                  validatee: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty.';
                    } else if (value.length < 4) {
                      return 'Username must be at least 4 characters long.';
                    } else if (value.length > 20) {
                      return 'Username cannot be longer than 20 characters.';
                    } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                      return 'Username can only contain letters, numbers, periods, and underscores.';
                    } else {
                      return null;
                    }
                  },
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
                  validatee: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile number cannot be empty.';
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Please enter a valid mobile number .';
                    } else {
                      return null;
                    }
                  },
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
                  validatee: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty.';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email.';
                    } else {
                      return null;
                    }
                  },
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
                  validatee: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pssword cannot be empty.';
                    } else if (value.length < 4) {
                      return 'Pssword must be at least 4 characters long.';
                    } else if (value.length > 20) {
                      return 'Pssword cannot be longer than 20 characters.';
                    } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                      return 'Pssword can only contain letters, numbers, periods, and underscores.';
                    } else {
                      return null;
                    }
                  },
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
                  validatee: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pssword cannot be empty.';
                    } else if (value.length < 4) {
                      return 'Pssword must be at least 4 characters long.';
                    } else if (value.length > 20) {
                      return 'Pssword cannot be longer than 20 characters.';
                    } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                      return 'Pssword can only contain letters, numbers, periods, and underscores.';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: queryheight / 20,
                ),
                Button(
                  text: 'Sign UP',
                  ontap: () {
                    registerationController.registerWithEmail();
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
