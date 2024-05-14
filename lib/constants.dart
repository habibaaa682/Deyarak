import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const ColorMain = Color(0xffFF725E);
const kprimarycolor = Color(0xffFF725E);
const double kiconsize = 30;
const fontname = 'Inter';
const propertyinfocolor = Color.fromARGB(255, 107, 107, 107);
SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;


myStyle({family = fontname, double? size = 14.0, color = Colors.black}) {
  return TextStyle(fontSize: size, color: color, fontFamily: family);
}
