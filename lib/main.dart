import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'bloc/theme_bloc/theme_cubit.dart';
import 'core/app_bloc_observer.dart';
import 'data/my_http_overrides.dart';
import 'core/navigation/route_generator.dart';

Future<void> main() async {
  // needs to be initialized before using workmanager package
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => ThemeCubit(),
      ),
    ], child: const HrTrace());
  }
}

class HrTrace extends StatelessWidget {
  const HrTrace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, themeData) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "appTitle",
        theme: themeData,
        //first initial splash screen
        initialRoute: '/main',
        //set-up route
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
