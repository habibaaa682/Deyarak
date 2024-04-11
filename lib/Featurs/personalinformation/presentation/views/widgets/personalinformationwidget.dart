import 'dart:io';

import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/appbarwidget.dart';
import 'package:deyarakapp/Featurs/personalinformation/presentation/views/widgets/personalinformationitem.dart';

import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class personalinformationwidget extends StatefulWidget {
  @override
  State<personalinformationwidget> createState() =>
      _personalinformationwidgetState();
}

class _personalinformationwidgetState extends State<personalinformationwidget> {
  static File? selectedimage;
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
            selectedimage != null
                ? Center(
                    child: Stack(children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(selectedimage!.path)),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () {
                            getImage();
                          },
                        ),
                        bottom: -10,
                        left: 65,
                      )
                    ]),
                  )
                : Center(
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/User-avatar.svg.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () {
                            getImage();
                          },
                        ),
                        bottom: -10,
                        left: 65,
                      )
                    ]),
                  ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kusername);
              },
              child: Personalinformationitem(
                base: 'User Name',
                hint: 'Ahmed Mohamed',
                last: 'Edit',
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kemail);
              },
              child: Personalinformationitem(
                base: 'Email',
                hint: 'AhmedMohamed@gmail.com',
                last: 'Edit',
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kphonenumber);
              },
              child: Personalinformationitem(
                base: 'Phone Number',
                hint: 'provide Phone Number',
                last: 'Add',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() {
      selectedimage = File(pickedFile.path);
    });
  }
}
