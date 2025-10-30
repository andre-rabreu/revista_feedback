import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revista_feedback/pages/home_page.dart';
import 'package:revista_feedback/pages/article_page.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(
        path: '/article/:id',
        redirect: (context, state) {
          final id = state.pathParameters['id'];
          if (id == null || int.tryParse(id) == null) {
            return '/';
          }
          return null;
        },
        builder: (context, state) {
          return ArticlePage(id: state.pathParameters['id']!);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Revista Feedback",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      routerConfig: _router,
    );
  }
}
