import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/personalinformationitem.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/uploadimagewidget.dart';

import 'package:deyarakapp/core/utils/router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/api_service.dart';

class personalinformationwidget extends StatefulWidget {
  @override
  State<personalinformationwidget> createState() =>
      _personalinformationwidgetState();
}

class _personalinformationwidgetState extends State<personalinformationwidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              text: 'Personal Information',
              h: 0.03,
            ),
            UploadImageWidget(), //ApiService(Dio())),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kusername);
              },
              child: Personalinformationitem(
                base: 'User Name',
                hint: '',
                last: 'Edit',
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kemail);
              },
              child: Personalinformationitem(
                base: 'Email',
                hint: '',
                last: 'Edit',
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kphonenumber);
              },
              child: Personalinformationitem(
                base: 'Phone Number',
                hint: '',
                last: 'Edit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
