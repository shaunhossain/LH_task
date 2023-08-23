import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_request_event.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/page/conference_info_page/tab/organizer_tab.dart';
import 'package:react_conf/ui/page/conference_info_page/tab/schedule_tab.dart';
import 'package:react_conf/ui/page/conference_info_page/tab/speakers_tab.dart';
import 'package:react_conf/ui/page/conference_info_page/tab/sponsors_tab.dart';

class ConferenceInfoPage extends StatefulWidget {
  const ConferenceInfoPage({super.key, required this.argument});
  final dynamic argument;

  @override
  State<ConferenceInfoPage> createState() => _ConferenceInfoPageState();
}

class _ConferenceInfoPageState extends State<ConferenceInfoPage> {

  @override
  void initState() {
    _getConferenceDetails();
    super.initState();
  }

  void _getConferenceDetails() {
    context.read<ConferenceDetailsBloc>().add(SendConferenceDetailsRequest(id: widget.argument.toString()));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: blackColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Conference info",
            style: h1TextStyle(blackColor),
          ),
          shadowColor: shadowColor,
          elevation: 8,
        bottom: TabBar(
          indicatorColor: primaryColor,
          labelColor: primaryColor,
          unselectedLabelColor: darkGreyColor,
          labelStyle: h5TextStyle(primaryColor),
          unselectedLabelStyle: p1TextStyle(darkGreyColor),
          tabs: const [
            Tab(text: "Organizer",),
            Tab(text: "Speakers"),
            Tab(text: "Schedule"),
            Tab(text: "Sponsors"),
          ],
        ),
      ),
            body: const TabBarView(
              children: [
                OrganizerTab(),
                SpeakersTab(),
                ScheduleTab(),
                SponsorsTab()
              ],
            ),
    ),
        ));
  }
}
