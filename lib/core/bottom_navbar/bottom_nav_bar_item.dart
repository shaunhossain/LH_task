import 'package:flutter/material.dart';

class BottomNavBarItem {

  BottomNavBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    required this.inactiveColor,
  });

  final String icon;
  final String title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign? textAlign;

}