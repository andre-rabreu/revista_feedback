import 'package:flutter/material.dart';
import 'package:revista_feedback/data.dart';
import 'package:revista_feedback/widgets/article_widget_mobile.dart';
import 'package:revista_feedback/widgets/article_widget_web.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalPagePadding;
    double logoWidth;

    MediaQuery.of(context).size.width > 800
        ? {horizontalPagePadding = 64, logoWidth = 512}
        : {horizontalPagePadding = 32, logoWidth = 384};

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width > 760 ? 96 : 16,
              horizontal: 16.0,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1024),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPagePadding,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 96),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: logoWidth),
                        child: Image.asset(
                          'assets/revista-feedback.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 96),
                      Column(
                        spacing: 64,
                        children: List<Widget>.generate(
                          5,
                          (int index) => MediaQuery.of(context).size.width > 760
                              ? ArticleWidgetWeb(
                                  id: index,
                                  title: data['$index']['titulo'] ?? 'Título',
                                  body: data['$index']['resumo'] ?? 'Corpo',
                                  imageUrl: data['$index']['imageUrl'] ?? '',
                                )
                              : ArticleWidgetMobile(
                                  id: index,
                                  title: data['$index']['titulo'] ?? 'Título',
                                  body: data['$index']['resumo'] ?? 'Corpo',
                                  imageUrl: data['$index']['imageUrl'] ?? '',
                                ),
                        ),
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
  }
}
