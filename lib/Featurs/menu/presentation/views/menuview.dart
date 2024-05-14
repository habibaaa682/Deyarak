import 'package:deyarakapp/Featurs/menu/presentation/views/widgets/menuwidget.dart';

import 'package:flutter/material.dart';

class MenueView extends StatefulWidget {
  const MenueView({super.key});

  @override
  State<MenueView> createState() => _MenueViewState();
}

class _MenueViewState extends State<MenueView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: menuwidget(),
      ),
    );
  }
}
