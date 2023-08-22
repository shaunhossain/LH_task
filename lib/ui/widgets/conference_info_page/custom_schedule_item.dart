import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_schedule_timeline_item.dart';
import 'package:react_conf/data/model/conference_detail_response/conference_detail_response.dart' as data;

class CustomScheduleItem extends StatelessWidget {
  const CustomScheduleItem({
    super.key,
    required this.date,
    required this.listOfInterval,
  });
  final DateTime date;
  final List<data.Interval>? listOfInterval;

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
                DateFormat('yyyy - MM - dd')
                    .format(date),
                style: h4TextStyle(blackColor),
              ),
              Text(
                DateFormat('EEEE')
                    .format(date),
                style: p2TextStyle(blackColor),
              ),
            ],
          ),
          Column(
            children: listOfInterval!.map((item) => Column(
              children: item.sessions!.map((subItem) => Column(
                children: [
                  CustomScheduleTimelineItem(
                      begin: subItem.begin ?? "", end: subItem.end ?? "", event: subItem.title ?? ""),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )).toList()
            )).toList(),
          ),
        ],
      ),
    );
  }
}
