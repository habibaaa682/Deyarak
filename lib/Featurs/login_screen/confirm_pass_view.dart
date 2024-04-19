import 'package:deyarakapp/Featurs/login_screen/widgets/confirm_pass_text_field.dart';
import 'package:deyarakapp/Featurs/login_screen/widgets/custom_button.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';

import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmNewPassword extends StatefulWidget {
  ConfirmNewPassword({super.key});

  @override
  State<ConfirmNewPassword> createState() => _ConfirmNewPasswordState();
}

class _ConfirmNewPasswordState extends State<ConfirmNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffFF725E), Color(0xffDF8256)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(100),
                    )),
              ),
              IconButton(
                  padding: EdgeInsets.only(top: 32),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              Positioned(
                top: 100,
                left: 20,
                child: Text(
                  'Reset your password',
                  style: Fonts.textstyle24.copyWith(color: Colors.white),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * .7,
                top: 140,
                left: 20,
                child: Text(
                  'Strong password include numbers,letters and panctuation marks.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Fonts.textstyle14.copyWith(color: Colors.white),
                ),
              ),
            ]),
            Container(
              height: MediaQuery.of(context).size.height * .6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
              child: Padding(
                padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
                child: Column(
                  children: [
                    const ConfirmationTextField(hint: 'Password'),
                    const SizedBox(
                      height: 40,
                    ),
                    const ConfirmationTextField(
                      hint: 'Confirm Password',
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      width: 250,
                      height: 65,
                      child: Button(
                          text: 'Reset Password',
                          ontap: () {},
                          raduis: 32,
                          colorr: kprimarycolor,
                          width: 0,
                          marginn: 0,
                          height: 0,
                          textcolor: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
