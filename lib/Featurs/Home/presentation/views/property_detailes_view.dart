import 'package:deyarakapp/Featurs/Home/data/repos/property%20details%20rebo/property_datails_repo_impl.dart';
import 'package:deyarakapp/Featurs/Home/presentation/manager/property_detailes_cubit/property_detailes_cubit.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/contact_method_bar.dart';
import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/property_detailes_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/service_locator.dart';

class PropertyDetailesView extends StatefulWidget {
  const PropertyDetailesView({super.key, required this.propertyId});
  final String propertyId;

  @override
  State<PropertyDetailesView> createState() => _PropertyDetailesViewState();
}

class _PropertyDetailesViewState extends State<PropertyDetailesView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.propertyId);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
        ),

        body: BlocProvider(
          create: (context) =>
              PropertyDetailesCubit(getIt.get<PropertyDetailesRepoImpl>()),
          child: PropertyDetailesBody(
            propertyId: widget.propertyId,
          ),
        ));
  }
}
