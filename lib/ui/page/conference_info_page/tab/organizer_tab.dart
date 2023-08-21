import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_organizer_item.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_schedule_item.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_speaker_item.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_sponsor_item.dart';

class OrganizerTab extends StatelessWidget {
  const OrganizerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// organizer
              const SizedBox(
                height: 24,
              ),
              Text(
                "Organizer",
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
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: whiteColor,
                  ),
                  child: ListView.builder(
                    itemCount: 20,
                      itemBuilder: (context,index){
                        return const CustomOrganizerItem(
                            imageUrl: "assets/example_pic.png",
                            name: "John Blain Doe",
                            about:
                            "Lorem ipsum dolor sit amet, con sec tetur ad ipi scin ssddg elit. Et con dim entum lectus in vel pellesn tesque arcu non odio.");
                      })
                ),
              ),

              /// Speaker
              const SizedBox(
                height: 32,
              ),
              Text(
                "Speakers",
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
                        itemCount: 20,
                        itemBuilder: (context,index){
                          return const CustomSpeakerItem(
                              imageUrl: "assets/example_person.png",
                              name: "John Blain Doe",
                              about:
                              "Lorem ipsum dolor sit amet, con sec tetur ad ipi scin ssddg elit. Et con dim entum lectus in vel pellesn tesque arcu non odio.");
                        })
                ),
              ),

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

              /// Sponsor
              const SizedBox(
                height: 32,
              ),
              Text(
                "Sponsors",
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
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: whiteColor,
                    ),
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context,index){
                          return const CustomSponsorItem(
                              imageUrl: "assets/example_pic.png",
                              name: "John Blain Doe",
                              about:
                              "Lorem ipsum dolor sit amet, con sec tetur ad ipi scin ssddg elit. Et con dim entum lectus in vel pellesn tesque arcu non odio.");
                        })
                ),
              ),
            ],
          )),
    );
  }
}
