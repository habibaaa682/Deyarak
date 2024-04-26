import 'package:deyarakapp/core/utils/fonts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Create_account_text extends StatelessWidget {
  String text1;
  String text2;

  Create_account_text({super.key, required this.text1, required this.text2});
  @override
  Widget build(BuildContext context) {
    // var queryheight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(text1, style: Fonts.textstyle16.copyWith(color: Colors.white)),
      Text(
        text2,
        style: Fonts.textstyle16.copyWith(
            color: Colors.white, decoration: TextDecoration.underline),
      ),
    ]);
  }
}
