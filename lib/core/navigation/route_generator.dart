import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_conf/bloc/conference_details_bloc/conference_details_bloc.dart';
import 'package:react_conf/bloc/conference_list_bloc/conference_list_bloc.dart';
import 'package:react_conf/bloc/internet_bloc/internet_bloc.dart';
import 'package:react_conf/bloc/sponsor_bloc/sponsor_bloc.dart';
import 'package:react_conf/data/client/client.dart';
import 'package:react_conf/data/repository/repository.dart';
import 'package:react_conf/ui/page/conference_info_page/conference_info_page.dart';
import 'package:react_conf/ui/page/home_page/home_page.dart';
import 'package:react_conf/ui/page/main_screen/main_page.dart';
import 'package:react_conf/ui/page/sponsor_page/sponsor_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final Repository repository = Repository(client: client.value);

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => InternetBloc(),
            ),
            BlocProvider(
              create: (_) => ConferenceListBloc(repository: repository),
            ),
          ], child: const HomePage()),
        );

      case '/sponsor':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => InternetBloc(),
            ),
            BlocProvider(
              create: (_) => SponsorBloc(repository: repository),
            ),
          ], child: const SponsorPage()),
        );

      case '/conference-info':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => InternetBloc(),
            ),
            BlocProvider(
              create: (_) => ConferenceDetailsBloc(repository: repository),
            ),
          ], child: ConferenceInfoPage(
            argument: args,
          )),
        );

      case '/main':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => InternetBloc(),
            ),
            BlocProvider(
              create: (_) => ConferenceListBloc(repository: repository),
            ),
            BlocProvider(
              create: (_) => SponsorBloc(repository: repository),
            ),
          ], child: const MainPage()),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
