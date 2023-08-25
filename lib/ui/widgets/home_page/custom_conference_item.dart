import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/home_page/highlighter_indicator.dart';

class CustomConferenceItem extends StatelessWidget {
  const CustomConferenceItem({super.key, required this.title, required this.about, required this.date, required this.onTap, required this.topLineColor, required this.bottomLineColor});
  final String title;
  final String about;
  final String date;
  final Function() onTap;
  final Color topLineColor;
  final Color bottomLineColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: SizeConfig.width! * 0.13,),
                    Container(
                      width: 2,
                      margin: const EdgeInsets.only(bottom: 5),
                      height: 20,
                      color: topLineColor,
                    ),
                  ],
                ),),
              Expanded(
                  flex: 5,
                  child: Container(
                      width: SizeConfig.width,
                      child: Text(date,style: p1TextStyle(darkGreyColor)))),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Highlighter(),
                    Container(
                      width: 2,
                      height: 118.5,
                      margin: const EdgeInsets.only(top: 5),
                      color: bottomLineColor,
                    ),
                  ],
                ),),
              Expanded(
                  flex: 5,
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
                            width: SizeConfig.width,
                            height: 5,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                              color: primaryColor,
                            ),
                          ),
                          Container(
                            width: SizeConfig.width,
                            height: SizeConfig.height! * 0.16,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
                              color: whiteColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
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
                                    Expanded(
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
            ],
          ),
        ],
      ),
    );
  }
}