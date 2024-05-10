import 'package:deyarakapp/Featurs/Home/presentation/manager/property_detailes_cubit/property_detailes_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/home_view_widgets/property_slideshow.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/amenties.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/contact_method_bar.dart';

import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/profilecard.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/property_description.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/property_info_column.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/related_suggestion_list.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/view_on_map_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (state is PropertyDetailesSuccess) {
          return Scaffold(
            bottomNavigationBar: ContactMethodBar(phone: state.propertydetailes[0].data!.owner!.phone.toString(), email:state.propertydetailes[0].data!.owner!.email.toString() ,),
            body: ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 32),
                      child: PropertySlideShow(
                        propertyModel: state.propertydetailes[0],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 24, right: 24, bottom: 8),
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
                    const ViewOnMapButton(),
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
                      discription:
                          state.propertydetailes[0].data!.description.toString(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    RelatedSuggestion(
                      propertyId: state.propertydetailes[0].data!.id.toString(),
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is PropertyDetailesFailure) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
