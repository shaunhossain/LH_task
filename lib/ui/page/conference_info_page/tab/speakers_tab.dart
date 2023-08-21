import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/styles.dart';

class SpeakersTab extends StatelessWidget {
  const SpeakersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
            "SpeakersTab",
            style: h1TextStyle(darkGreyColor),
          )),
    );
  }
}
