import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/home_page/highlighter_indicator.dart';

class CustomConferenceItem extends StatelessWidget {
  const CustomConferenceItem({super.key, required this.title, required this.about, required this.date, required this.onTap});
  final String title;
  final String about;
  final String date;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SizeConfig.width,
      height: SizeConfig.height! * 0.25,
      child: Stack(
        children: [
          const Positioned(
              top: 20,
              left: 16,
              child: Highlighter()),
          Positioned(
              left: SizeConfig.width! * 0.1,
              top: SizeConfig.height! * 0.105,
              child: Container(
                width: 2,
                height: SizeConfig.height! * 0.16,
                color: primaryColor,
              )),
          Positioned(
              left: SizeConfig.width! * 0.22,
              top: 25,
              child: GestureDetector(
                onTap: onTap,
                child: Card(
                  elevation: 8,
                  shadowColor: shadowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: SizeConfig.width! * 0.73,
                        height: 5,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                          color: primaryColor,
                        ),
                      ),
                      Container(
                        width: SizeConfig.width! * 0.73,
                        height: SizeConfig.height! * 0.15,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
                          color: whiteColor,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: primaryColor,width: 4.5)
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: 5,
                                    child: Text(title,style: h3TextStyle(blackColor),))
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Text(about,style: p1TextStyle(darkGreyColor),maxLines: 3,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              left: SizeConfig.width! * 0.22,
              top: -2,
              child: Text(date,style: p1TextStyle(darkGreyColor),)),
        ],
      ),
    );
  }
}
