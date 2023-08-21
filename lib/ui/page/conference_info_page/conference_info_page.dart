import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';

class ConferenceInfoPage extends StatelessWidget {
  const ConferenceInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Conference Page",style: h1TextStyle(darkGreyColor),)),
    ));
  }
}
