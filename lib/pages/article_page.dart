import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:revista_feedback/data.dart';

class ArticlePage extends StatelessWidget {
  final String id;

  const ArticlePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    double titleFontSize;
    double bodyFontSize;
    double categoryFontSize;
    double horizontalPagePadding;

    MediaQuery.of(context).size.width > 800
        ? {
            titleFontSize = 48,
            bodyFontSize = 24,
            categoryFontSize = 28,
            horizontalPagePadding = 64,
          }
        : {
            titleFontSize = 36,
            bodyFontSize = 16,
            categoryFontSize = 24,
            horizontalPagePadding = 32,
          };

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 96.0,
              horizontal: 16.0,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1024),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPagePadding
                  ),
                  child: Column(
                    spacing: 24,
                    children: [
                      SizedBox(height: 32),
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
                              Text(
                                'Categoria',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: categoryFontSize,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data[id]['titulo'],
                                  style: TextStyle(
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(children: [Text('01/01/2025, 00h00')]),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              data[id]['imageUrl'],
                              height: 256,
                              fit: BoxFit.fitHeight,
                            ),
                            Icon(
                              Icons.play_circle,
                              color: Colors.white,
                              size: 64,
                            ),
                          ],
                        ),
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
                      SizedBox(height: 64),
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
