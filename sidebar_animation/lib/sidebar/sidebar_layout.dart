import 'package:flutter/material.dart';
import 'package:sidebar_animation/pages/homepage.dart';
import 'package:sidebar_animation/sidebar/sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          SideBar(),
        ],
      ),
    );
  }
}
