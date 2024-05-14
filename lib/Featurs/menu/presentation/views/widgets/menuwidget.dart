

import 'package:deyarakapp/Featurs/menu/presentation/views/widgets/menuitemwidget.dart';
import 'package:deyarakapp/Featurs/menu/presentation/views/widgets/profilemenuwidget.dart';
import 'package:deyarakapp/Featurs/profile/presentation/manger/cubit/userprofile_cubit.dart';
import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:deyarakapp/core/utils/router.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';

class menuwidget extends StatefulWidget {
  @override
  State<menuwidget> createState() => _menuwidgetState();
}

class _menuwidgetState extends State<menuwidget> {
  @override
  Widget build(BuildContext context) {
    var queryheight = MediaQuery.of(context).size.height;
    var querywidth = MediaQuery.of(context).size.width;

    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 16),
          child: Text(
            'Menu',
            style: Fonts.textstyle40,
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kprofile);
          },
          child: BlocBuilder<UserprofileCubit, UserprofileState>(
            builder: (context, state) {
              if (state is UserprofileSuccess) {
                return profilemenuwidget(userobj: state.userprofile);
              } else if (state is UserprofileFailure) {
                return CustomErrorWidget(errMsg: state.errMsg);
              } else {
                return Center(
                  child: CustomLoadingIndicator(),
                );
              }
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kpersonalinformation);
          },
          child: menuitemwidget(
            text: 'Personal Information',
            icon: FontAwesomeIcons.circleUser,
          ),
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.ksettings);
            },
            child: menuitemwidget(
                text: 'Settings', icon: Icons.settings_outlined)),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kaboutus);
          },
          child: menuitemwidget(
            text: 'About Us',
            icon: Icons.info_outline_rounded,
          ),
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kcontactus);
            },
            child: menuitemwidget(
                text: 'Contact Us', icon: Icons.headset_mic_outlined)),
        SizedBox(
          height: queryheight / 8,
        ),
        Button(
          text: 'Log Out',
          ontap: () {
            logoutUser();

          },
          raduis: 35,
          colorr:kprimarycolor ,
          width: querywidth /400,
          marginn: 0,
          height: queryheight / 37,
          textcolor: Colors.white,
        ),
      ],
    );
  }
  void logoutUser() async{
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
    GoRouter.of(context as BuildContext).push(AppRouter.ksplash);

  }


}

