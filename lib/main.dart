// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/bloc/get_business_news_bloc/business_news_bloc.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/pages/business_news_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<BusinessNewsBloc>()..add(GetBusinessNewsEvent()),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Business News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BusinessPage(),
      ),
    );
  }
}