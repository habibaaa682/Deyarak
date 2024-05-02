import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    required this.buttcolor,
    required this.txtcolor,
    required this.bordradius,
  });
  final String txt;
  final Color buttcolor;
  final Color txtcolor;
  final BorderRadius bordradius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .07,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          txt,
          style: Fonts.textstyle16
              .copyWith(color: txtcolor, fontWeight: FontWeight.w500),
        ),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: bordradius)),
          backgroundColor: MaterialStatePropertyAll(buttcolor),
        ),
      ),
    );
  }
}
