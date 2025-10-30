import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:revista_feedback/data.dart';

class ArticlePage extends StatelessWidget {
  final String id;

  const ArticlePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    double titleFontSize;
    double subtitleFontSize;
    double bodyFontSize;
    double categoryFontSize;
    double horizontalPagePadding;

    MediaQuery.of(context).size.width > 800
        ? {
            titleFontSize = 48,
            subtitleFontSize = 36,
            bodyFontSize = 24,
            categoryFontSize = 28,
            horizontalPagePadding = 64,
          }
        : {
            titleFontSize = 36,
            subtitleFontSize = 24,
            bodyFontSize = 16,
            categoryFontSize = 20,
            horizontalPagePadding = 32,
          };

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
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  child: Column(
                    spacing: 24,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            iconSize: 36,
                            onPressed: () => context.go('/'),
                            icon: Icon(Icons.arrow_back),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data[id]['titulo'],
                                  style: TextStyle(
                                    height: 1.2,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data[id]['resumo'],
                              style: TextStyle(fontSize: bodyFontSize),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Image.network(
                          data[id]['imageUrl'],
                          width: 512,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data[id]['subtitulo'],
                              style: TextStyle(
                                height: 1.2,
                                fontSize: subtitleFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              data[id]['conteudo'],
                              style: TextStyle(fontSize: bodyFontSize),
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
