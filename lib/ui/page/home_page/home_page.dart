import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_list_bloc.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_request_event.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_request_state.dart';
import 'package:react_conf/bloc/internet_bloc/internet_bloc.dart';
import 'package:react_conf/bloc/internet_bloc/internet_state.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
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
    context.read<ConferenceListBloc>().add(SendConferenceRequest());
    super.initState();
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
            },
            child: BlocBuilder<ConferenceListBloc,ConferenceRequestState>(
              builder: (context,state){
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CustomConferenceItem(
                        title: 'Design systems for beginners',
                        about: 'The workshop will provide you with all the basics',
                        date: '02 September, 2023',
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/conference-info',
                          );
                        },
                      ),
                      CustomConferenceItem(
                        title: 'Design systems for beginners',
                        about: 'The workshop will provide you with all the basics',
                        date: '02 September, 2023',
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/conference-info',
                          );
                        },
                      ),
                      CustomConferenceItem(
                        title: 'Design systems for beginners',
                        about: 'The workshop will provide you with all the basics',
                        date: '02 September, 2023',
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/conference-info',
                          );
                        },
                      ),
                      CustomConferenceLastItem(
                        title: 'Design systems for beginners',
                        about: 'The workshop will provide you with all the basics',
                        date: '02 September, 2023',
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/conference-info',
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            )
          ),
    ));
  }
}
