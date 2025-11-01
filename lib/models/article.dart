import 'package:flutter/foundation.dart' show immutable;

// Implementar no futuro:
// https://github.com/flutter/flutter/issues/81739
// [flutter_markdown] Support maxLines and overflow

@immutable
class Article {
  final int id;
  final String title;
  final String summary;
  final String body;
  final String imageUrl;

  const Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.body,
    required this.imageUrl,
  });

  factory Article.fromYaml(Map<String, dynamic> metadata, String body) {
    final String summary = metadata['summary'] as String;

    return Article(
      id: int.parse(metadata['id']),
      title: metadata['title'] as String,
      summary: summary,
      imageUrl: metadata['imageUrl'] as String,
      body: body,
    );
  }
}
