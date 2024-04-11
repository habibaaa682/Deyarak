import 'package:deyarakapp/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Create_account_text extends StatelessWidget {
  String text1;
  String text2;

  Create_account_text({super.key, required this.text1, required this.text2});
  @override
  Widget build(BuildContext context) {
    var querywidth = MediaQuery.of(context).size.width;

    // var queryheight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(text1, style: myStyle(color: Colors.white, size: querywidth / 25)),
      Text(
        text2,
        style: myStyle(size: querywidth / 25, color: Colors.white),
      ),
    ]);
  }
}
