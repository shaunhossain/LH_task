import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/query_list.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/data/client/client.dart';
import 'package:react_conf/data/repository/repository.dart';
import 'package:react_conf/ui/widgets/home_page/custom_conference_item.dart';
import 'package:react_conf/ui/widgets/home_page/custom_conference_last_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Repository repository = Repository(client: client.value);

  @override
  void initState() {
    repository.getPosts(query: conferenceQuery(id: 'freezing-edge-2020'));
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
      body: SingleChildScrollView(
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
      ),
    ));
  }
}
