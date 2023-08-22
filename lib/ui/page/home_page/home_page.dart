import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_list_bloc.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_request_event.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_request_state.dart';
import 'package:react_conf/bloc/internet_bloc/internet_bloc.dart';
import 'package:react_conf/bloc/internet_bloc/internet_state.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/custom_retry_button.dart';
import 'package:react_conf/ui/widgets/home_page/custom_conference_item.dart';
import 'package:react_conf/ui/widgets/home_page/custom_conference_last_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var hasInternet = true;

  @override
  void initState() {
    _getConferenceList();
    super.initState();
  }

  void _getConferenceList() {
    context.read<ConferenceListBloc>().add(SendConferenceRequest());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8),
          child: SvgPicture.asset(
            "assets/react_conf_icon.svg",
            width: SizeConfig.width! * 0.29,
            height: SizeConfig.height! * 0.06,
            fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        shadowColor: shadowColor,
        elevation: 8,
      ),
      body:
          BlocListener<InternetBloc, InternetState>(listener: (context, state) {
        if (state is Disconnected) {
          setState(() {
            hasInternet = false;
          });
        } else {
          setState(() {
            hasInternet = true;
          });
        }
      }, child: BlocBuilder<ConferenceListBloc, ConferenceRequestState>(
        builder: (context, state) {
          if (state is InitialConferenceRequest &&
              state is SendingConferenceRequest) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          if (state is GetConferenceListSuccessfully) {
            return RefreshIndicator(
              onRefresh: () async {
                _getConferenceList();
              },
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 32,
                    ),
                  ),
                  SliverList.builder(
                      itemCount: state.listOfConference.length,
                      itemBuilder: (context, index) {
                        if (state.listOfConference.length == index + 1) {
                          return CustomConferenceLastItem(
                            title: state.listOfConference[index].name ?? "",
                            about: state.listOfConference[index].slogan ?? "",
                            date: DateFormat('d MMMM, yyyy').format(
                                state.listOfConference[index].startDate!),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/conference-info',
                                arguments: state.listOfConference[index].id
                              );
                            },
                          );
                        }
                        return CustomConferenceItem(
                          title: state.listOfConference[index].name ?? "",
                          about: state.listOfConference[index].slogan ?? "",
                          date: DateFormat('d MMMM, yyyy')
                              .format(state.listOfConference[index].startDate!),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/conference-info',
                                arguments: state.listOfConference[index].id
                            );
                          },
                        );
                      })
                ],
              ),
            );
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
                        _getConferenceList();
                      },
                      textColor: Colors.white))
            ],
          ));
        },
      )),
    ));
  }
}
