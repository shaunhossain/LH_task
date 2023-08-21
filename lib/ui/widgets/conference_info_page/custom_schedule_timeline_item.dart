import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';

class CustomScheduleTimelineItem extends StatelessWidget {
  const CustomScheduleTimelineItem(
      {super.key,
      required this.begin,
      required this.end,
      required this.event});
  final String begin;
  final String end;
  final String event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Duration : $begin-$end",
          style: p1TextStyle(blackColor),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 5,
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                  color: blackColor, shape: BoxShape.circle),
            ),
            Text(event, style: p1TextStyle(blackColor)),
          ],
        ),
      ],
    );
  }
}
