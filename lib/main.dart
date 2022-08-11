// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/core/news_layout/news_layout.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/bloc/get_business_news_bloc/business_news_bloc.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/bloc/get_science_news_bloc/science_news_bloc.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/bloc/get_sports_news_bloc/sports_news_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<BusinessNewsBloc>()..add(GetBusinessNewsEvent()),),
        BlocProvider(create: (_) => di.sl<ScienceNewsBloc>()..add(GetScienceNewsEvent()),),
        BlocProvider(create: (_) => di.sl<SportsNewsBloc>()..add(GetSportsNewsEvent()),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsBottomNavBar(),
      ),
    );
  }
}