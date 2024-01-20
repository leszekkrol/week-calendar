import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_bloc.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    required this.child,
    super.key
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(),
      child: _StartView(child: child),
    );
  }
}

class _StartView extends StatelessWidget {
  const _StartView({
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}