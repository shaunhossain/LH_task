import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_schedule_timeline_item.dart';

class CustomScheduleItem extends StatelessWidget {
  const CustomScheduleItem({
    super.key,
    required this.date,
    required this.day,
  });
  final String date;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: h4TextStyle(blackColor),
              ),
              Text(
                day,
                style: p2TextStyle(blackColor),
              ),
            ],
          ),
          const CustomScheduleTimelineItem(
              begin: "05:00", end: "06:00", event: "Registration"),
          const SizedBox(
            height: 16,
          ),
          const CustomScheduleTimelineItem(
              begin: "05:00", end: "06:00", event: "Registration"),
          const SizedBox(
            height: 16,
          ),
          const CustomScheduleTimelineItem(
              begin: "05:00", end: "06:00", event: "Registration"),
          const SizedBox(
            height: 16,
          ),
          const CustomScheduleTimelineItem(
              begin: "05:00", end: "06:00", event: "Registration"),
        ],
      ),
    );
  }
}
