<<<<<<< HEAD
import 'package:deyarakapp/Featurs/login_screen/Reset_pass_screen.dart';

=======
>>>>>>> 146c9139df60c6a8530635b0d1d0d4600523daf1
import 'package:deyarakapp/core/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class forget_pass_text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var querywidth = MediaQuery.of(context).size.width;
    // var queryheight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(right: querywidth / 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kresetpass);
          },
          child: const Text(
            'Forgot Password ?',
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationThickness: 1),
          ),
        ),
      ),
    );
  }
}
