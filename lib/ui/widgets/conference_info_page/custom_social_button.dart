import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({super.key, required this.icon, required this.onTap});
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
        child: SvgPicture.asset(icon,width: 14,height: 14,fit: BoxFit.scaleDown,));
  }
}
