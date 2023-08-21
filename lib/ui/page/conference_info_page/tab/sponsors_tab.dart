import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/styles.dart';

class SponsorsTab extends StatelessWidget {
  const SponsorsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
            "SponsorsTab",
            style: h1TextStyle(darkGreyColor),
          )),
    );
  }
}
