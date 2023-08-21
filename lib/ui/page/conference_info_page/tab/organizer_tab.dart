import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/styles.dart';

class OrganizerTab extends StatelessWidget {
  const OrganizerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
            "Organizer Tab",
            style: h1TextStyle(darkGreyColor),
          )),
    );
  }
}
