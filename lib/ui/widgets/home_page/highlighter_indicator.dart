import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';

class Highlighter extends StatelessWidget {
  const Highlighter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width! * 0.13,
      height: SizeConfig.width! * 0.13,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1,color: primaryColor)
      ),
      child: SvgPicture.asset("assets/highlighter_icon.svg",width: SizeConfig.width! * 0.045,height: SizeConfig.height! * 0.03,fit: BoxFit.scaleDown,),
    );
  }
}
