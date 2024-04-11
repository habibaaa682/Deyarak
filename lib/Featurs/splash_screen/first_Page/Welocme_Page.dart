import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';

import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class welcome_page extends StatelessWidget {
  const welcome_page({super.key});
  @override
  Widget build(BuildContext context) {
    var querywidth = MediaQuery.of(context).size.width;
    var queryheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.khome);
                  },
                  icon: Icon(
                    Icons.close,
                    size: querywidth / 8,
                  )),
            ),
            Image.asset('assets/pics/Housesearchingcuate.png'),
            SizedBox(
              height: queryheight / 30,
            ),
            Button(
              text: 'Sign UP',
              ontap: () {
                GoRouter.of(context).push(AppRouter.kregister);
              },
              raduis: 35,
              colorr: kprimarycolor,
              width: querywidth / 235,
              marginn: 0,
              height: queryheight / 37,
              textcolor: Colors.white,
            ),
            SizedBox(
              height: queryheight / 20,
            ),
            Button(
              text: 'Sign IN',
              ontap: () {
                GoRouter.of(context).push(AppRouter.klogin);
              },
              raduis: 35,
              colorr: kprimarycolor,
              width: querywidth / 235,
              marginn: 0,
              height: queryheight / 37,
              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
