
import 'package:cyber_sec/views/desktop_view.dart';
import 'package:cyber_sec/views/mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:ScreenTypeLayout.builder(
        desktop: (context)=>DesktopView(),
        mobile: (context)=>MobileView(),
      )
    );
  }
}
