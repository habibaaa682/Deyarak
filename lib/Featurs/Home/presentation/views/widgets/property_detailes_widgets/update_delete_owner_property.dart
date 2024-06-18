import 'package:deyarakapp/Featurs/Home/presentation/views/widgets/property_detailes_widgets/update_property.dart';
import 'package:deyarakapp/controllers/property_controller.dart';
import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateDeleteOwnerProperty extends StatelessWidget {
  const UpdateDeleteOwnerProperty({super.key, required this.propertyId});
final String propertyId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
             GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
          Spacer(),
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              PropertyController(ApiService(Dio())).deleteProperty(context, propertyId: propertyId, token: GlobalSharedPreferences.getString(
                  'token'));
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
