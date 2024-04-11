import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/customtextfield.dart';

import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class confirmpasswidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appbar(text: '', h: .03),
              Text('Confirm Your Password',
                  style:
                      Fonts.textstyle24.copyWith(fontWeight: FontWeight.bold)),
              Text(
                  'Complete your deactivation request by entering the password associated with your account.',
                  style: Fonts.textstyle14.copyWith(color: Colors.grey)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.045,
              ),
              customtextfield(
                  password: true,
                  hinttext: '',
                  labeltext: 'confirm password',
                  keyboard: TextInputType.visiblePassword,
                  validatee: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password cannot be empty.';
                    } else {
                      return null;
                    }
                  }),
              Button(
                text: 'Deactivate',
                ontap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Deactivate your Account?'),
                          contentPadding: EdgeInsets.all(16),
                          children: [
                            Text('Your account will be deactivated'),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      GoRouter.of(context)
                                          .push(AppRouter.kwelcome);
                                    },
                                    child: Text('Yes,Deactivate')),
                                TextButton(
                                    onPressed: () {
                                      GoRouter.of(context).pop();
                                    },
                                    child: Text('cancel')),
                              ],
                            ),
                          ],
                        );
                      });
                },
                raduis: 15,
                colorr: kprimarycolor,
                width: 4.2,
                marginn: 3,
                height: 18,
                textcolor: Colors.white,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class w extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Column(children: [
        Text('Confirm Your Password',
            style: Fonts.textstyle24.copyWith(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
