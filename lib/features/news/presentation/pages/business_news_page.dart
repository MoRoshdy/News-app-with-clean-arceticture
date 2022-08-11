// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/core/widgets/loading_widget.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/bloc/get_business_news_bloc/business_news_bloc.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/widgets/business_page_widgets/message_display_widget.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/widgets/business_page_widgets/news_list_%20widget.dart';

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<BusinessNewsBloc, BusinessNewsState>(
        builder: (context, state) {
          if (state is LoadingBusinessNewsState) {
            return const LoadingWidget();
          } else if (state is LoadedBusinessNewsState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: NewsList(news: state.news,),
            );
          } else if (state is ErrorLoadingBusinessNewsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }


  Future<void> _onRefresh(context) async {
    BlocProvider.of<BusinessNewsBloc>(context).add(RefreshBusinessNewsEvent());
  }
}
