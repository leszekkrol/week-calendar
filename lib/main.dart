import 'package:weekcalendar/router.dart';
import 'package:weekcalendar/utils/app_theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/layout.dart';

import 'app/app_bloc.dart';
import 'bootstrap.dart';

void main() {
  bootstrap(() => const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: const _AppContent(),
    );
  }
}

class _AppContent extends StatelessWidget {
  const _AppContent();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppBloc, AppState, bool>(
      selector: (state) => state.isDarkModeEnabled,
      builder: (context, isDarkModeEnabled) {
        return Layout(
            child: MaterialApp.router(
              theme: isDarkModeEnabled ? AppThemeManager.darkTheme : AppThemeManager.lightTheme,
              routerConfig: appRouter,
            )
        );
      },
    );
  }
}