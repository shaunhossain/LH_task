import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';

class SponsorPage extends StatelessWidget {
  const SponsorPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: Center(child: Text("SponsorPage",style: h1TextStyle(darkGreyColor),)),
    ));
  }
}
