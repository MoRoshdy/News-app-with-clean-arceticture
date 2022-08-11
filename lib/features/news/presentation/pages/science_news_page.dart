// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_clean_architecture/core/widgets/loading_widget.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/bloc/get_science_news_bloc/science_news_bloc.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/widgets/business_page_widgets/message_display_widget.dart';
import 'package:news_app_with_clean_architecture/features/news/presentation/widgets/business_page_widgets/news_list_%20widget.dart';

class SciencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ScienceNewsBloc, ScienceNewsState>(
        builder: (context, state) {
          if (state is LoadingScienceNewsState) {
            return const LoadingWidget();
          } else if (state is LoadedScienceNewsState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: NewsList(
                news: state.news,
              ),
            );
          } else if (state is ErrorLoadingScienceNewsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(context) async {
    BlocProvider.of<ScienceNewsBloc>(context).add(RefreshScienceNewsEvent());
  }
}
