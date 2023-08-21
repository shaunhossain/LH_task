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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: darkWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("data"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
