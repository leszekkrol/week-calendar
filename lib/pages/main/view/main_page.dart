import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MainView();
  }
}

class _MainView extends StatelessWidget {
  const _MainView();

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World!");
  }
}