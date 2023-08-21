import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/ui/widgets/home_page/highlighter_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: SvgPicture.asset("assets/react_conf_icon.svg",width: SizeConfig.width! * 0.29, height: SizeConfig.height! * 0.06,fit: BoxFit.cover,),
        // centerTitle: true,
        elevation: 1,
      ),
      body: const Column(
        children: [
          Highlighter()
        ],
      ),
    ));
  }
}
