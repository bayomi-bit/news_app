import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featurs/home/logic/news_cubit.dart';
import 'featurs/logic_app/theme_cubit.dart';
import 'my_app.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => NewsCubit()..getData(),
    ),
    BlocProvider(create: (context) => ThemeCubit()..getTheme()),
  ], child: const MyApp()));
}
