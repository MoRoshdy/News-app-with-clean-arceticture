

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:news_app_with_clean_architecture/features/news/domain/entities/news_entity.dart';

class NewsList extends StatelessWidget {
  final News news;

  const NewsList({super.key, required this.news});


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
                  image: NetworkImage(news.articles[index].urlToImage ?? 'https://thumbs.dreamstime.com/b/no-image-available-icon-vector-illustration-flat-design-140633878.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(news.articles[index].title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(news.articles[index].publishedAt,),
                  ],
                ),
              ),
            ],
          );
        },
        itemCount: news.articles.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 3.0,
        ),
      ),
    );
  }
}