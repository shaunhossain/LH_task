import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';

class CustomRetryButton extends StatelessWidget {
  const CustomRetryButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.onPress,
      required this.textColor,
      this.height = 28})
      : super(key: key);
  final String title;
  final Color color;
  final Color textColor;
  final Function() onPress;
  final double height;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialButton(
        minWidth: SizeConfig.width! * 0.3,
        height: height,
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: color,
            )),
        onPressed: onPress,
        child: Center(
          child: Text(
            title,
            style: p1TextStyle(whiteColor),
          ),
        ));
  }
}
