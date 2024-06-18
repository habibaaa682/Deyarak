import 'package:deyarakapp/Featurs/Home/data/Models/property_modell/property_modell.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/Property_Owner/owner_card.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/Property_Owner/owner_confirmation.dart';
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

class OwnerProfile extends StatefulWidget {
  const OwnerProfile({super.key, required this.propertyObj});
  final PropertyModell propertyObj;
  @override
  State<OwnerProfile> createState() => _OwnerProfileState();
}


class _OwnerProfileState extends State<OwnerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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

                OwnerCard(
                          propertyObj: widget.propertyObj,
                        ),

                  Owner_Confirmation(
                 propertyModell: widget.propertyObj,
                        ),

                  /*  RelatedSuggestion(),*/
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
