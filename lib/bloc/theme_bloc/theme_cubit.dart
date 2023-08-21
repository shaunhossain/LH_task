
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_conf/core/app_themes.dart';

class ThemeCubit extends Cubit<ThemeData> {

  ThemeCubit() : super(appThemeData[AppTheme.lightMode]!);

  void changeTheme(AppTheme theme) => emit(appThemeData[theme]!);
}