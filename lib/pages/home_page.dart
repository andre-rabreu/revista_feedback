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
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 225, 182, 255),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 960),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth > 800 ? 32 : 24,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 64.0),
                        child: Image.asset(
                          'assets/revista-feedback.png',
                          width: constraints.maxWidth > 800 ? 440 : 320,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        children: constraints.maxWidth <= 800
                            ? [
                                Column(
                                  spacing: 24,
                                  children: List<Widget>.generate(
                                    articles.length,
                                    (int index) {
                                      return ArticleWidgetMobile(
                                        article: articles[index],
                                      );
                                    },
                                  ),
                                ),
                              ]
                            : [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        spacing: 32,
                                        children: [
                                          ArticleWidgetMobile(
                                            article: articles[0],
                                          ),
                                          ArticleWidgetMobile(
                                            article: articles[2],
                                          ),
                                          ArticleWidgetMobile(
                                            article: articles[4],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 32),
                                    Expanded(
                                      child: Column(
                                        spacing: 32,
                                        children: [
                                          ArticleWidgetMobile(
                                            article: articles[1],
                                          ),
                                          ArticleWidgetMobile(
                                            article: articles[3],
                                          ),
                                          ArticleWidgetMobile(
                                            article: articles[5],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                      ),
                      SizedBox(height: 96),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
