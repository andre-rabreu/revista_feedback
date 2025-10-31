import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:revista_feedback/models/article.dart';
import 'package:yaml/yaml.dart';

class ArticleService {
  // ignore: prefer_final_fields
  Map<String, Article> _articles = {};

  Future<void> loadArticles() async {
    final manifestString = await rootBundle.loadString(
      'articles/manifest.json',
    );
    final List<dynamic> manifestList = json.decode(manifestString);

    for (var filename in manifestList) {
      final rawContent = await rootBundle.loadString('articles/$filename');
      final parts = rawContent.split('---');

      if (parts.length < 3) {
        // IGNORE
        continue;
      }

      final metadata = Map<String, dynamic>.from(loadYaml(parts[1]));
      final body = parts[2].trim();
      final article = Article.fromYaml(metadata, body);

      if (_articles.containsKey('${article.id}')) {
        // IGNORE
        continue;
      }

      _articles['${article.id}'] = article;
    }
  }

  List<Article> getAllArticles() {
    return _articles.values.toList();
  }

  Article? getArticleById(String id) {
    return _articles[id];
  }
}
