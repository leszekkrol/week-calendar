import 'package:weekcalendar/pages/main/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'layout/main/view/main_layout.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _startNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'start');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _startNavigatorKey,
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
            path: '/',
            parentNavigatorKey: _startNavigatorKey,
            builder: (context, state) => const MainPage()
        ),
      ],
    ),
  ],
);