import 'package:flutter/material.dart';
import 'package:flutter_mvvm/navigation/app_navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppNavigator(),
    ),
  );
}
