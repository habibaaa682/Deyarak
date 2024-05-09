import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/related_suggestion_list.dart';
import 'package:deyarakapp/Featurs/profile/presentation/manger/cubit/userprofile_cubit.dart';
import 'package:deyarakapp/Featurs/profile/presentation/widgets/confirmedinformation.dart';
import 'package:deyarakapp/Featurs/profile/presentation/widgets/profilecard.dart';
import 'package:deyarakapp/Featurs/settings/presentation/widgets/deactivateaccountitem.dart';
import 'package:deyarakapp/core/widgets/custom_error_widget.dart';
import 'package:deyarakapp/core/widgets/custom_loading_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class profilewidget extends StatefulWidget {
  profilewidget({super.key});

  @override
  State<profilewidget> createState() => _profilewidgetState();
}

class _profilewidgetState extends State<profilewidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                BlocBuilder<UserprofileCubit, UserprofileState>(
                  builder: (context, state) {
                    if (state is UserprofileSuccess) {
                      return profilecard(
                        userobj: state.userprofile,
                      );
                    } else if (state is UserprofileFailure) {
                      return CustomErrorWidget(errMsg: state.errMsg);
                    } else {
                      return Center(
                        child: CustomLoadingIndicator(),
                      );
                    }
                  },
                ),
                BlocBuilder<UserprofileCubit, UserprofileState>(
                  builder: (context, state) {
                    if (state is UserprofileSuccess) {
                      return confirmation(
                        userobj: state.userprofile,
                      );
                    } else if (state is UserprofileFailure) {
                      return CustomErrorWidget(errMsg: state.errMsg);
                    } else {
                      return Center(
                        child: CustomLoadingIndicator(),
                      );
                    }
                  },
                ),
              /*  RelatedSuggestion(),*/
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
                deactivateaccountitemwidget(base: 'report', hint: ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
