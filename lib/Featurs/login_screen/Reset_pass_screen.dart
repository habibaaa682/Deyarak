import 'package:deyarakapp/Featurs/register_screen/widget/TextFieldInput.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';

import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
          'assets/images/padlock (1).png',
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .28,
        ),
        SizedBox(
          height: 70,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .7,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFF725E), Color(0xffDF8256)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                'Forget Pssword',
                style: Fonts.textstyle30.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldInputt(
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
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .57,
                height: MediaQuery.of(context).size.height * .06,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: Fonts.textstyle16.copyWith(
                        color: kprimarycolor, fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
