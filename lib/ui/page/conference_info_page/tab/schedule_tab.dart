import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_request_state.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/conference_info_page/custom_schedule_item.dart';
import 'package:react_conf/ui/widgets/custom_retry_button.dart';

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ConferenceDetailsBloc, ConferenceDetailsRequestState>(
          builder: (context, state) {
            if (state is SendingConferenceDetailsRequest) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            if (state is GetConferenceDetailsSuccessfully) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
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
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child:  Card(
                            elevation: 0,
                            color: whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                                width: SizeConfig.width,
                                padding: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: whiteColor,
                                ),
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: state.conferenceDetailData.conference?.schedules?.length,
                                    itemBuilder: (context, index) {
                                      return CustomScheduleItem(
                                          date: state.conferenceDetailData.conference!.schedules![index].day!,
                                          listOfInterval: state.conferenceDetailData.conference!.schedules![index].intervals);
                                    })),
                          ),
                        )
                      ]
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