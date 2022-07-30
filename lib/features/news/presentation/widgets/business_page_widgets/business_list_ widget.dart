

import 'package:flutter/material.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';

class BusinessNewsList extends StatelessWidget {
  final List<News> news;

  const BusinessNewsList({super.key, required this.news});

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(news[index].articles.urlToImage),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(news[index].articles.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(news[index].articles.publishedAt,),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: news.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 3.0,
        ),
      ),
    );
  }
}
