import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_conf/bloc/internet_bloc/internet_bloc.dart';
import 'package:react_conf/bloc/internet_bloc/internet_state.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_bloc.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_request_event.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_request_state.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/custom_retry_button.dart';

class SponsorPage extends StatefulWidget {
  const SponsorPage({super.key});

  @override
  State<SponsorPage> createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  bool hasInternet = true;

  @override
  void initState() {
    _getConferenceList();
    super.initState();
  }

  void _getConferenceList() {
    context.read<SponsorBloc>().add(SendSponsorRequest());
  }

  List<String> widgetList = ['A', 'B', 'C'];
  List<String> widgetList2 = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "Our Sponsor",
                style: h1TextStyle(blackColor),
              ),
              centerTitle: true,
              shadowColor: shadowColor,
              elevation: 8,
            ),
            body: BlocListener<InternetBloc, InternetState>(
                listener: (context, state) {
              if (state is Disconnected) {
                setState(() {
                  hasInternet = false;
                });
              } else {
                setState(() {
                  hasInternet = true;
                });
              }
            }, child: BlocBuilder<SponsorBloc, SponsorRequestState>(
              builder: (context, state) {
                if (state is SendingSponsorRequest) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
                if (state is GetSponsorListSuccessfully) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        if (state.listOfGoldSponsors.isNotEmpty)
                          Column(
                            children: [
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
                                  height: state.listOfGoldSponsors.length > 4 ? 200 : 160,
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: whiteColor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "🥇 Gold Sponsor",
                                        style: p1TextStyle(darkGreyColor),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Flexible(
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.5,
                                          children: state.listOfGoldSponsors.map((item) => Container(
                                            height: 20.0,
                                            color: Colors.green,
                                            margin: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text(
                                                item.name ?? "",
                                                style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )).toList(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          const SizedBox(),
                        if (state.listOfBronzeSponsors.isNotEmpty)
                          Column(
                            children: [
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
                                  height: state.listOfBronzeSponsors.length > 4 ? 200 : 160,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "🥈 Silver Sponsor",
                                        style: p1TextStyle(darkGreyColor),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Flexible(
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.5,
                                          children: state.listOfBronzeSponsors.map((item) => Container(
                                            height: 20.0,
                                            color: Colors.green,
                                            margin: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text(
                                                item.name ?? "",
                                                style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )).toList(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          const SizedBox(),
                        if (state.listOfSponsors.isNotEmpty)
                          Column(
                            children: [
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
                                  height: state.listOfSponsors.length > 4 ? 220 : 160,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "🥉 Sponsors",
                                        style: p1TextStyle(darkGreyColor),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Flexible(
                                        child: GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2.5,
                                          children: state.listOfSponsors.map((item) => Container(
                                            height: 20.0,
                                            color: Colors.green,
                                            margin: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: Text(
                                                item.name ?? "",
                                                style: const TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )).toList(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          const SizedBox(),
                        const SizedBox(
                          height: 24,
                        ),
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
            ))));
  }
}
