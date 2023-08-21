import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_schedule_item.dart';

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Schedule
              const SizedBox(
                height: 32,
              ),
              Text(
                "Schedule",
                style: h1TextStyle(blackColor),
              ),
              const SizedBox(
                height: 24,
              ),
              Card(
                elevation: 0,
                color: whiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                    width: SizeConfig.width,
                    height: SizeConfig.height! * 0.58,
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor,
                    ),
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return const CustomScheduleItem(
                              date: "2022-09-14",
                              day: "Wednesday");
                        })
                ),
              ),

            ],
          )),
    );
  }
}
