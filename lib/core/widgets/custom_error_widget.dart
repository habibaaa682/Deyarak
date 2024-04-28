import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMsg});
  final String errMsg;
  @override
  Widget build(BuildContext context) {
    return Text(
      errMsg,
      style: Fonts.textstyle16,
    );
  }
}
