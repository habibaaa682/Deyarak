import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class menuitemwidget extends StatefulWidget {
  String text;
  var icon;
  menuitemwidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  State<menuitemwidget> createState() => _menuitemwidgetState();
}

class _menuitemwidgetState extends State<menuitemwidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16, vertical: MediaQuery.of(context).size.height * .028),
      child: Column(children: [
        Row(
          children: [
            Icon(
              widget.icon,
              size: 32,
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              widget.text,
              style: Fonts.textstyle16,
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              size: 32,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Color(0xff303030)),
            )),
          ),
        ),
      ]),
    );
  }
}
