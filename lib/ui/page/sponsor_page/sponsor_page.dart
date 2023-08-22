import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_bloc.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_request_event.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';

class SponsorPage extends StatefulWidget {
  const SponsorPage({super.key});

  @override
  State<SponsorPage> createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {

  @override
  void initState() {
    _getConferenceList();
    super.initState();
  }

  void _getConferenceList() {
    context.read<SponsorBloc>().add(SendSponsorRequest());
  }

  List<String> widgetList = ['A', 'B', 'C'];
  List<String> widgetList2 = ['A', 'B', 'C','D','E','F','G'];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Our Sponsor",style: h1TextStyle(blackColor),),
        centerTitle: true,
        shadowColor: shadowColor,
        elevation: 8,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 24,),
            Card(
              elevation: 0,
              color: whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: SizeConfig.width,
                height: widgetList.length > 4 ? 200 : 160,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("🥇 Gold Sponsor",style: p1TextStyle(darkGreyColor),),
                    const SizedBox(height: 20,),
                    Flexible(
                      child: GridView.count(
                          crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        children: widgetList.map((String value) {
                          return Container(
                            height: 20.0,
                            color: Colors.green,
                            margin: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 18.0,color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24,),
            Card(
              elevation: 0,
              color: whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: SizeConfig.width,
                height: widgetList.length > 4 ? 200 : 160,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("🥈 Silver Sponsor",style: p1TextStyle(darkGreyColor),),
                    const SizedBox(height: 20,),
                    Flexible(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        children: widgetList.map((String value) {
                          return Container(
                            height: 20.0,
                            color: Colors.green,
                            margin: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 18.0,color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24,),
            Card(
              elevation: 0,
              color: whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: SizeConfig.width,
                height: widgetList2.length > 4 ? 220 : 160,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("🥉 Bronze Sponsors",style: p1TextStyle(darkGreyColor),),
                    const SizedBox(height: 20,),
                    Flexible(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        children: widgetList2.map((String value) {
                          return Container(
                            height: 20.0,
                            color: Colors.green,
                            margin: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 18.0,color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24,),
          ],
        ),
      ),
    ));
  }
}
