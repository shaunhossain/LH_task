import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_request_state.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_organizer_item.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_schedule_item.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_speaker_item.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_sponsor_item.dart';
import 'package:react_conf/ui/widgets/custom_retry_button.dart';

class OrganizerTab extends StatelessWidget {
  const OrganizerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ConferenceDetailsBloc, ConferenceDetailsRequestState>(
          builder: (context, state) {
        if (state is InitialConferenceDetailsRequest &&
            state is SendingConferenceDetailsRequest) {
          return const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          );
        }
        if (state is GetConferenceDetailsSuccessfully) {
          return SingleChildScrollView(
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
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: whiteColor,
                        ),
                        child: ListView.builder(
                            itemCount: state.conferenceDetailData.conference?.organizers?.length,
                            itemBuilder: (context, index) {
                              return CustomOrganizerItem(
                                  imageUrl: state.conferenceDetailData.conference?.organizers?[index].image?.url ?? "",
                                  name: state.conferenceDetailData.conference?.organizers?[index].name ?? "",
                                  about: state.conferenceDetailData.conference?.organizers?[index].about ?? "");
                            })),
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
                            itemCount: state.conferenceDetailData.conference?.speakers?.length,
                            itemBuilder: (context, index) {
                              //log("errorOnConference -> ${state.conferenceDetailData.conference?.speakers?[index].image?.url} \n ${state.conferenceDetailData.conference?.speakers?[index].name}");
                              return CustomSpeakerItem(
                                  imageUrl: state.conferenceDetailData.conference?.speakers?[index].image?.url ?? "",
                                  name: state.conferenceDetailData.conference?.speakers?[index].name ?? "",
                                  about: state.conferenceDetailData.conference?.speakers?[index].about ?? "");
                            })),
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
                            itemBuilder: (context, index) {
                              return const CustomScheduleItem(
                                  date: "2022-09-14", day: "Wednesday");
                            })),
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
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: whiteColor,
                        ),
                        child: ListView.builder(
                            itemCount: state.conferenceDetailData.conference?.sponsors?.length,
                            itemBuilder: (context, index) {
                              return CustomSponsorItem(
                                  imageUrl: state.conferenceDetailData.conference?.sponsors?[index].image?.url ?? "",
                                  name: state.conferenceDetailData.conference?.sponsors?[index].name ?? "",
                                  about: state.conferenceDetailData.conference?.sponsors?[index].about ?? "");
                            })),
                  ),
                ],
              ));
        }

        return Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.height! * 0.3,
            ),
            Text(
              'No Data Found',
              style: h4TextStyle(darkGreyColor),
            ),
            SizedBox(
                width: SizeConfig.width! * 0.3,
                child: CustomRetryButton(
                    title: "Retry",
                    color: primaryColor,
                    onPress: () {
                      //_getConferenceList();
                    },
                    textColor: Colors.white))
          ],
        ));
      }),
    );
  }
}
