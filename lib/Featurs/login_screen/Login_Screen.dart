import 'package:deyarakapp/Featurs/login_screen/widgets/forget_pass.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/Featurs/register_screen/register_view.dart';
import 'package:deyarakapp/Featurs/register_screen/widget/TextFieldInput.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/controllers/login_controller.dart';
import 'package:deyarakapp/controllers/registeration_controller.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'CreateAccount_Text.dart';
// import 'forget_pass.dart';

class Login_screen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  Login_screen({super.key});
  @override
  Widget build(BuildContext context) {
    var querywidth = MediaQuery.of(context).size.width;
    var queryheight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(physics: NeverScrollableScrollPhysics(), children: [
      Image.asset(
        'assets/pics/houseSearch.png',
        height: queryheight / 2,
      ),
      Container(
        padding: EdgeInsets.only(top: queryheight / 20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffFF725E), Color(0xffDF8256)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        height: querywidth,
        child: Column(
          children: [
            TextFieldInputt(
              textEditingController: loginController.emailController,
              text: 'Email',
              colorr: Colors.white,
              function: () {},
              icon: Icons.person,
              formatter: [],
              password: false,
              validatee: (value) {
                // ignore: unnecessary_null_comparison
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
              textEditingController: loginController.passwordController,
              text: 'Password',
              colorr: Colors.white,
              function: () {},
              icon: Icons.lock,
              formatter: [],
              password: true,
              validatee: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty.';
                } else if (value.length < 4) {
                  return 'Pssword must be at least 4 characters long.';
                } else if (value.length > 20) {
                  return 'Pssword cannot be longer than 20 characters.';
                } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
                  return 'password can only contain letters, numbers, periods, and underscores.';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: queryheight / 100,
            ),
            forget_pass_text(),
            SizedBox(
              height: queryheight / 25,
            ),
            Button(
              text: 'Sign IN',
              ontap: () {
                loginController.loginWithEmail();
                GoRouter.of(context).push(AppRouter.khome);
              },
              raduis: 35,
              colorr: Colors.white,
              width: querywidth / 235,
              marginn: 0,
              height: queryheight / 37,
              textcolor: kprimarycolor,
            ),
            SizedBox(
              height: queryheight / 30,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kregister);
              },
              child: Create_account_text(
                  text1: 'Dont have an account ?', text2: '  Register now'),
            ),
          ],
        ),
      )
    ]));
  }
}
