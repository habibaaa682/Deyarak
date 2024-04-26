import 'package:deyarakapp/constants.dart';
import 'package:flutter/material.dart';

class ConfirmationTextField extends StatefulWidget {
  const ConfirmationTextField({super.key, required this.hint});
  final String hint;
  @override
  State<ConfirmationTextField> createState() => _ConfirmationTextFieldState();
}

class _ConfirmationTextFieldState extends State<ConfirmationTextField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty.';
        } else if (value.length < 4) {
          return 'Pssword must be at least 4 characters long.';
        } else if (value.length > 20) {
          return 'Pssword cannot be longer than 20 characters.';
        } else if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(value)) {
          return 'password can only contain letters, numbers, periods, and underscores.';
        } else {
          return null;
        }
      },
      obscureText: obsecure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 60, vertical: 35),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: kprimarycolor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: kprimarycolor)),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obsecure = !obsecure;
              });
            },
            icon: Icon(obsecure ? Icons.visibility : Icons.visibility_off)),
        suffixIconColor: Colors.grey,
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          color: kprimarycolor,
        ),
        hintText: widget.hint,
      ),
    );
  }
}
