import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';

import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../personalinformation/presentation/views/widgets/Button.dart';

class deactivateaccountwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            appbar(text: 'Deactivate Account', h: 0.03),
            Text('This Will deactivate your Account',
                style: Fonts.textstyle24.copyWith(fontWeight: FontWeight.bold)),
            Text(
                'You are about to start the process of deactivating your account.your public profile will no longer be viewable on Deyarak.com',
                style: Fonts.textstyle14.copyWith(color: Colors.grey)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Text('What else you should know',
                style: Fonts.textstyle24.copyWith(fontWeight: FontWeight.bold)),
            Text(
                'you can restore your account if it was accidentally or wrongfully deactivated for up to 30 days after deactivation',
                style: Fonts.textstyle14.copyWith(color: Colors.grey)),
            Button(
              text: 'Deactivate',
              ontap: () {
                GoRouter.of(context).push(AppRouter.kconfirmpass);
              },
              raduis: 15,
              colorr: kprimarycolor,
              width: 4,
              marginn: 0,
              height: 18,
              textcolor: Colors.white,
            ),
          ]),
        ),
      ),
    );
  }
}
