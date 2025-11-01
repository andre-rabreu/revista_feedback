import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:revista_feedback/models/article.dart';

class ArticleWidgetMobile extends StatelessWidget {
  final Article article;

  const ArticleWidgetMobile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/article/${article.id}');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(35, 0, 0, 0),
                spreadRadius: 5.0,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                child: Image.network(
                  article.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,

                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width > 350
                            ? 20
                            : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black45,
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.width > 350
                            ? 12
                            : 8,
                      ),
                    ),
                    // Text(
                    //   article.summary,
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 4,
                    //   style: TextStyle(
                    //     fontSize: MediaQuery.of(context).size.width > 350
                    //         ? 16
                    //         : 12,
                    //   ),
                    // ),
                    MarkdownBody(
                      data: article.summary,
                      styleSheet: MarkdownStyleSheet(
                        p: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 350
                              ? 16
                              : 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
