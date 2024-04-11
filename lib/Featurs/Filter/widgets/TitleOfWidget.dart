import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleOfWidget extends StatelessWidget {
  TitleOfWidget({
    required this.title,
    super.key,
  });

  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
      ),
    );
  }
}