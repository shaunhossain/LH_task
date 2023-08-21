import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';

class SponsorPage extends StatelessWidget {
  const SponsorPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<String> widgetList = ['A', 'B', 'C'];
    List<String> widgetList2 = ['A', 'B', 'C','D','E','F','G'];

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Card(
              elevation: 0,
              color: darkWhiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: SizeConfig.width,
                height: widgetList.length > 4 ? 200 : 160,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text("data"),
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
            Card(
              elevation: 0,
              color: darkWhiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: SizeConfig.width,
                height: widgetList2.length > 4 ? 220 : 160,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text("data"),
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
            )
          ],
        ),
      ),
    ));
  }
}
