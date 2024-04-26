import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/settings/presentation/widgets/deactivateaccountitem.dart';

import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:deyarakapp/core/utils/router.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:deyarakapp/theme/themeprovider.dart';

class settingswidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              text: 'Settings',
              h: 0.03,
            ),
            GestureDetector(
                onTap: () {
                  Provider.of<ThemeProvide>(context, listen: false)
                      .Toggletheme();
                },
                child: switchbutton()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kdeactivateaccount);
              },
              child: deactivateaccountitemwidget(
                base: 'Deactivate Account',
                hint: 'Find out how to Activate your Account',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class switchbutton extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<switchbutton> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dark Mode',
            style: Fonts.textstyle24,
          ),
          Switch(
            value: switchValue,
            onChanged: (newValue) {
              setState(() {
                switchValue = newValue;
                Provider.of<ThemeProvide>(context, listen: false).Toggletheme();
              });
            },
          ),
        ],
      ),
    );
  }
}
