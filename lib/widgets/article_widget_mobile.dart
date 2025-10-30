import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleWidgetMobile extends StatefulWidget {
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
  State<ArticleWidgetMobile> createState() => _ArticleWidgetMobileState();
}

class _ArticleWidgetMobileState extends State<ArticleWidgetMobile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        isHovering = true;
      }),
      onExit: (event) => setState(() {
        isHovering = false;
      }),
      child: GestureDetector(
        onTap: () {
          context.go('/article/${widget.id}');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isHovering ? Colors.black : Colors.grey.shade300,
              width: 1,
            ),
            color: Colors.grey[300],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                child: Image.network(
                  widget.imageUrl,
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
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black45,
                      margin: const EdgeInsets.only(bottom: 12),
                    ),
                    Text(
                      widget.body,
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
