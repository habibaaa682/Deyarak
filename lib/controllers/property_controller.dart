import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/utils/api_service.dart';

class PropertyController {
  final ApiService apiService;

  PropertyController (this.apiService);

  Future<void> deleteProperty(BuildContext context,
      {
        required String propertyId,
        required String token}) async {
    try {
      final response = await apiService.delete(
          endPointPath: 'properties/$propertyId',
          token: token);

      if (response.statusCode == 204) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Property Deleted Successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('some thing went wrong'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

}