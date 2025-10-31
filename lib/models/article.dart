import 'package:flutter/foundation.dart' show immutable;

// Implementar no futuro:
// https://github.com/flutter/flutter/issues/81739
// [flutter_markdown] Support maxLines and overflow

@immutable
class Article {
  final int id;
  final String title;
  final String subtitle;
  final String summary;
  final String plainSummary;
  final String body;
  final String imageUrl;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.summary,
    required this.plainSummary,
    required this.body,
    required this.imageUrl,
  });

  @override
  String toString() {
    final String truncSummary = plainSummary.length > 40
        ? '${plainSummary.substring(0, 40)}...'
        : plainSummary;

    return 'Article(id: $id, title: "$title", summary: "$truncSummary")';
  }

  factory Article.fromYaml(Map<String, dynamic> metadata, String body) {
    final String summary = metadata['summary'] as String;

    return Article(
      id: int.parse(metadata['id']),
      title: metadata['title'] as String,
      subtitle: metadata['subtitle'] as String,
      summary: summary,
      plainSummary: summary.replaceAll(RegExp(r'(\*\*|\*)'), ''),
      imageUrl: metadata['imageUrl'] as String,
      body: body,
    );
  }
}
