import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:react_conf/bloc/bottom_navbar_bloc/bottom_navbar_bloc.dart';
import 'package:react_conf/core/bottom_navbar/bottom_nav_bar_item.dart';
import 'package:react_conf/core/bottom_navbar/custom_animated_bottom_bar.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/ui/page/home_page/home_page.dart';
import 'package:react_conf/ui/page/sponsor_page/sponsor_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Confirm Exit"),
                content: const Text("Are you sure you want to exit?"),
                actions:[
                  MaterialButton(
                    child: const Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  MaterialButton(
                    child: const Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
        );
        return Future.value(true);
      },
      child: Scaffold(
        body: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return const HomePage();
              case NavBarItem.SPONSOR:
                return const SponsorPage();
              default:
                return const HomePage();
            }
          },
        ),
        bottomNavigationBar: StreamBuilder(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            return CustomAnimatedBottomBar(
              containerHeight: 60,
              backgroundColor: Colors.white,
              selectedIndex: snapshot.data!.index,
              showElevation: true,
              itemCornerRadius: 12,
              curve: Curves.easeIn,
              onItemSelected: _bottomNavBarBloc.pickItem,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              items: <BottomNavBarItem>[
                BottomNavBarItem(
                  icon: "assets/home_icon.svg",
                  title: 'Home',
                  activeColor: primaryColor,
                  inactiveColor: greyColor,
                  textAlign: TextAlign.center,
                ),
                BottomNavBarItem(
                  icon: "assets/sponsor_icon.svg",
                  title: 'Sponsor',
                  activeColor: primaryColor,
                  inactiveColor: greyColor,
                  textAlign: TextAlign.center,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}