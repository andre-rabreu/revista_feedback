import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revista_feedback/models/article.dart';
import 'package:revista_feedback/services/article_service.dart';
import 'package:revista_feedback/widgets/article_widget_mobile.dart';
import 'package:revista_feedback/widgets/article_widget_web.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.read<ArticleService>();
    final List<Article> articles = service.getAllArticles();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 96, horizontal: 16.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 1024),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 64),
                        child: Column(
                          children: [
                            SizedBox(height: 96),
                            Image.asset(
                              'assets/revista-feedback.png',
                              width: 512,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 96),
                            Column(
                              spacing: 64,
                              children: List<Widget>.generate(articles.length, (
                                int index,
                              ) {
                                return ArticleWidgetWeb(
                                  id: index,
                                  title: articles[index].title,
                                  body: articles[index].body,
                                  imageUrl: articles[index].imageUrl,
                                );
                              }),
                            ),
                            SizedBox(height: 96),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 225, 182, 255),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 64.0),
                        child: Image.asset(
                          'assets/revista-feedback.png',
                          width: 384,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        spacing: 32,
                        children: List<Widget>.generate(articles.length, (
                          int index,
                        ) {
                          return ArticleWidgetMobile(article: articles[index]);
                        }),
                      ),
                      SizedBox(height: 96),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
