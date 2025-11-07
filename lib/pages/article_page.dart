import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:revista_feedback/models/article.dart';
import 'package:revista_feedback/services/article_service.dart';

class ArticlePage extends StatelessWidget {
  final String id;

  const ArticlePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final service = context.read<ArticleService>();
    final Article? article = service.getArticleById(id);

    // MediaQuery.of(context).size.width > 800
    //     ? {
    //         titleFontSize = 48,
    //         subtitleFontSize = 36,
    //         bodyFontSize = 24,
    //         categoryFontSize = 28,
    //         horizontalPagePadding = 64,
    //       }
    //     : {
    //         titleFontSize = 36,
    //         subtitleFontSize = 24,
    //         bodyFontSize = 16,
    //         categoryFontSize = 20,
    //         horizontalPagePadding = 32,
    //       };

    if (article == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Artigo não encontrado')),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 182, 255),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 64),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1024),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width > 800 ? 28 : 20,
                  ),
                  child: Column(
                    spacing: 24,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            iconSize: 36,
                            onPressed: () => context.go('/home'),
                            icon: Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              article.title,
                              style: TextStyle(
                                height: 1.2,
                                fontSize:
                                    MediaQuery.of(context).size.width > 800
                                    ? 36
                                    : 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Image.network(
                          article.imageUrl,
                          width: 512,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MarkdownBody(
                              data: article.body,
                              styleSheet: MarkdownStyleSheet(
                                p: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width > 800
                                      ? 24
                                      : 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
