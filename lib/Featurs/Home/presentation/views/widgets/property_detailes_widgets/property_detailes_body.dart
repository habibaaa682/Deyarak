import 'package:deyarakapp/Featurs/Home/presentation/manager/property_detailes_cubit/property_detailes_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/property_slideshow.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/amenties.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/contact_method_bar.dart';

import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/Property_Owner/profilecard.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/property_description.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/property_info_column.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/related_suggestion_list.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/update_delete_owner_property.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/view_on_map_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/service_locator.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../data/repos/property details rebo/property_datails_repo_impl.dart';
import '../home_view_widgets/image_slide_show.dart';

class PropertyDetailesBody extends StatefulWidget {
  const PropertyDetailesBody({super.key, required this.propertyId});
  final String propertyId;

  @override
  State<PropertyDetailesBody> createState() => _PropertyDetailesBodyState();
}

class _PropertyDetailesBodyState extends State<PropertyDetailesBody> {
  late PropertyDetailesCubit propertyDetailesCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    propertyDetailesCubit = context.read<PropertyDetailesCubit>();
    propertyDetailesCubit.getPropertyDetailes(propertyId: widget.propertyId);

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailesCubit, PropertyDetailesState>(
      builder: (context, state) {

        if (state is PropertyDetailesSuccess && state!.propertydetailes![0].data!.isOwner!) {
          return Scaffold(
            bottomNavigationBar: ContactMethodBar(
              phone: state.propertydetailes[0].data!.owner!.phone.toString(),
              email: state.propertydetailes[0].data!.owner!.email.toString(),
            ),
            body: ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    UpdateDeleteOwnerProperty(propertyId:state.propertydetailes[0].data!.id.toString() ,),
                    PropertySlideShow(
                      propertyModel: state.propertydetailes[0],
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 24, right: 24, bottom: 8),
                        child: Expanded(
                            child: ProprtyInfoColumn(
                          propertyModel: state.propertydetailes[0],
                        ))),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 8),
                      child: Expanded(
                          child: Amenties(
                        propertyModel: state.propertydetailes[0],
                      )),
                    ),
                    ViewOnMapButton(
                        lat: state.propertydetailes[0].data!.locations!
                            .coordinates![0]
                            .toDouble(),
                        lng: state.propertydetailes[0].data!.locations!
                            .coordinates![1]
                            .toDouble()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    ProfileCard(
                      propertyModel: state.propertydetailes[0],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Description(
                      discription: state.propertydetailes[0].data!.description
                          .toString(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: RelatedSuggestion(
                        propertyId:
                            state.propertydetailes[0].data!.id.toString(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }else if (state is PropertyDetailesSuccess && state!.propertydetailes![0].data!.isOwner== false
        ) {
          return Scaffold(
            bottomNavigationBar: ContactMethodBar(
              phone: state.propertydetailes[0].data!.owner!.phone.toString(),
              email: state.propertydetailes[0].data!.owner!.email.toString(),
            ),
            body: ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                SafeArea(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),

                  ],
                ),
              ),
                    PropertySlideShow(
                      propertyModel: state.propertydetailes[0],
                    ),
                    Padding(
                        padding:
                        EdgeInsets.only(left: 24, right: 24, bottom: 8),
                        child: Expanded(
                            child: ProprtyInfoColumn(
                              propertyModel: state.propertydetailes[0],
                            ))),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 8),
                      child: Expanded(
                          child: Amenties(
                            propertyModel: state.propertydetailes[0],
                          )),
                    ),
                    ViewOnMapButton(
                        lat: state.propertydetailes[0].data!.locations!
                            .coordinates![0]
                            .toDouble(),
                        lng: state.propertydetailes[0].data!.locations!
                            .coordinates![1]
                            .toDouble()),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    ProfileCard(
                      propertyModel: state.propertydetailes[0],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Description(
                      discription: state.propertydetailes[0].data!.description
                          .toString(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: RelatedSuggestion(
                        propertyId:
                        state.propertydetailes[0].data!.id.toString(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        else if (state is PropertyDetailesFailure) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
