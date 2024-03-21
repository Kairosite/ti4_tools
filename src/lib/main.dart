import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import 'package:ti4_tools/screens/home_view.dart';
import 'package:ti4_tools/screens/testUI_view.dart';


void main() {
  // For widgets to be able to read providers, wrap the application in a
  // "ProviderScope" widget. This is where the state of the providers will be stored.
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twilight Imperium Tools',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TestUIView(),
    );
  }
}