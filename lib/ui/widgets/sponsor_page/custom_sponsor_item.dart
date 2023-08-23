import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:react_conf/core/util/size_config.dart';

class CustomSponsorItem extends StatelessWidget {
  const CustomSponsorItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
            width: SizeConfig.width! * 0.23,
            height: 24,
            margin: const EdgeInsets.all(8.0),
            child: Image.network(imageUrl,
                width: SizeConfig.width! * 0.23,
                height: 24,
                fit: BoxFit.scaleDown,
                errorBuilder: (context, error, stackTrace) =>
                    SvgPicture.network(
                      imageUrl,
                      width: SizeConfig.width! * 0.23,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    ))));
  }
}
