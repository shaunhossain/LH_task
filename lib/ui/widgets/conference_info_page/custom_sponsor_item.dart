import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';

class CustomSponsorItem extends StatelessWidget {
  const CustomSponsorItem({super.key, required this.imageUrl, required this.name, required this.about});
  final String imageUrl;
  final String name;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.network(
                imageUrl,
                width: SizeConfig.width! * 0.24,
                height: SizeConfig.width! * 0.24,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: h4TextStyle(blackColor),),
                  const SizedBox(height: 8,),
                  Text(about,style: p2TextStyle(blackColor),maxLines: 5,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
