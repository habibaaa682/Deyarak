import 'package:deyarakapp/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class custommarker extends StatelessWidget {
  final double price;

  const custommarker({super.key, required this.price});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
              size: 50,
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 15),
            color: Colors.white,
            child: Text(
              '$price',
              style: Fonts.textstyle14,
            ),
          ),
        ],
      ),
    );
  }
}
