import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'bottom_nav_bar_item.dart';


class CustomAnimatedBottomBar extends StatelessWidget {

  const CustomAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  }) : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: containerHeight,
          padding: EdgeInsets.symmetric(vertical: SizeConfig.height! * 0.01, horizontal: SizeConfig.width! * 0.025),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Center(
                child: IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor ?? item.activeColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SvgPicture.asset(
                        item.icon,
                        width: SizeConfig.width! * 0.06,
                        height: SizeConfig.width! * 0.06,
                        fit: BoxFit.cover,
                        color: isSelected ? item.activeColor : item.inactiveColor,
                    ),
                  ),
                ),
              ),
              if (!isSelected)
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      item.title,
                      style: sh5TextStyle(isSelected ? item.activeColor : item.inactiveColor),
                    )),

              if (isSelected)
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      item.title,
                      style: sh5TextStyle(isSelected ? item.activeColor : item.inactiveColor),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}