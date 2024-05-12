import 'package:deyarakapp/controllers/sharedPrefrenceController.dart';
import 'package:deyarakapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key, required this.onSubmitted,
  });
  final Function(String)onSubmitted;
  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {

String myText='';
  final TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(32),
      shadowColor: Colors.grey,
      elevation: 3,
      child: TextField(
       onSubmitted:(text){
         widget.onSubmitted(text);
        // textEditingController.clear();
       }

        ,
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: 'Where to?',
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          hintText: 'Any where ,Any week',
          focusedBorder: Styles.borderstyle,
          enabledBorder: Styles.borderstyle,
          prefixIcon: IconButton(
              onPressed: () {


              },
              icon: const Icon(
                Icons.search,
                size: 32,
                color: Colors.black,
              )),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();

  }
}
