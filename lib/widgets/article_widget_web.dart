import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleWidgetWeb extends StatefulWidget {
  final String title;
  final String body;
  final String imageUrl;
  final int id;

  const ArticleWidgetWeb({
    super.key,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.id,
  });

  @override
  State<ArticleWidgetWeb> createState() => _ArticleWidgetWebState();
}

class _ArticleWidgetWebState extends State<ArticleWidgetWeb> {
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
        child: SizedBox(
          height: 260,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isHovering ? Colors.black : Colors.grey.shade300,
                width: 1,
              ),
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.black45,
                          margin: const EdgeInsets.only(bottom: 12),
                        ),
                        Expanded(
                          child: Text(
                            widget.body,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 6,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
