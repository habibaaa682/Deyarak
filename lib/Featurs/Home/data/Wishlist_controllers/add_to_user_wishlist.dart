
import 'dart:convert';

import 'package:deyarakapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../controllers/sharedPrefrenceController.dart';
import '../../../../core/utils/api_endpoints.dart';

class WishlistController {

  final ApiService apiService;

  WishlistController(this.apiService);

  Future<void> addToWishlist(BuildContext context,{required String userId,required String propertyId,required String token}) async {
    try {

      final response = await apiService.post(endPointPath:'users/add-to-wishlist/$userId/$propertyId',token:token );

      if (response.statusCode==200) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Property Added to Wishlist'),
            backgroundColor: Colors.green,
          ),
        );

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('some thing went wrong'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }catch (e) {

       print(e.toString());

    }
  }


  Future<void> removeFromWishlist(BuildContext context,{required String userId,required String propertyId,required String token}) async {
    try {

      final response = await apiService.post(endPointPath:'users/remove-from-wishlist/$userId/$propertyId',token:token );

      if (response.statusCode==200) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Property Removed from Wishlist'),
            backgroundColor: Colors.green,
          ),
        );

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('some thing went wrong'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }catch (e) {

      print(e.toString());

    }
  }
}
