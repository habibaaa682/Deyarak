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

class menuwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                text: 'Contact Us', icon: Icons.headset_mic_outlined))
      ],
    );
  }
}
