import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revista_feedback/app.dart';
import 'package:revista_feedback/services/article_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final articleService = ArticleService();
  await articleService.loadArticles();

  runApp(Provider<ArticleService>(create: (_) => articleService, child: App()));
}
