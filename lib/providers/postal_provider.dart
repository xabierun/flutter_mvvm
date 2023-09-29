import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タイトルプロバイダー(固定値)
final titleProvider = Provider<String>((ref) => 'Flutter Demo Home Page');

/// メッセージプロバイダー(固定値)
final messageProvider =
    Provider((ref) => 'You have pushed the button this many times:');

/// カウント監視プロバイダー
final countProvider = StateProvider((ref) => 0);
