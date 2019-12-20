import 'dart:convert';
import 'webservice.dart';
import 'constants.dart';

class NewsArticle {

  final String title;
  final String descrption;
  final String urlToImage;
  final String url;

  NewsArticle({this.title, this.descrption, this.urlToImage, this.url});

  factory NewsArticle.fromJson(Map<String,dynamic> json) {
    return NewsArticle(
        title: json['title'],
        descrption: json['description'],
        urlToImage: json['urlToImage'],
        url: json['url'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL
    );

  }

  static Resource<List<NewsArticle>> get all {

    return Resource(
        url: Constants.HEADLINE_NEWS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          Iterable list = result['articles'];
          return list.map((model) => NewsArticle.fromJson(model)).toList();
        }
    );

  }

}