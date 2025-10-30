import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleWidgetMobile extends StatelessWidget {
  final String title;
  final String body;
  final String imageUrl;
  final int id;

  const ArticleWidgetMobile({
    super.key,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/article/$id');
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
                  imageUrl,
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
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black45,
                      margin: const EdgeInsets.only(bottom: 12),
                    ),
                    Text(
                      body,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(fontSize: 16),
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
