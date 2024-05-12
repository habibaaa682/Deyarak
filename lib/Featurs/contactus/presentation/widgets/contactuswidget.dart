import 'package:deyarakapp/Featurs/contactus/data/contactUsController.dart';
import 'package:deyarakapp/Featurs/contactus/presentation/widgets/messagecontactus.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/Button.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/customtextfield.dart';
import 'package:deyarakapp/constants.dart';
import 'package:deyarakapp/core/utils/api_service.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class contactuswidget extends StatelessWidget {
  contactUsController contactusController =
      Get.put(contactUsController(ApiService(Dio())));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
              text: 'Contact Us',
              h: 0.03,
            ),
            customtextfield(
              textEditingController: contactusController.nameController,
              password: false,
              hinttext: '',
              labeltext: 'User Name',
            ),
            customtextfield(
              textEditingController: contactusController.phoneController,
              hinttext: '',
              labeltext: 'Phone Number',
              password: false,
            ),
            customtextfield(
              textEditingController: contactusController.messageTitleController,
              password: false,
              hinttext: '',
              labeltext: 'Message Title',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: messagecontactus(
                textEditingController: contactusController.messageController,
              ),
            ),
            const SizedBox(height: 15),
            Button(
              text: 'Send',
              ontap: () {
                contactUsController(ApiService(Dio()))
                    .contactUsMessage(context);
              },
              raduis: 15,
              colorr: kprimarycolor,
              width: 4.2,
              marginn: 3,
              height: 18,
              textcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
