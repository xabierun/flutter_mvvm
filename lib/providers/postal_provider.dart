import 'package:flutter_riverpod/flutter_riverpod.dart';

/// タイトルプロバイダー(固定値)
final titleProvider = Provider<String>((ref) => '郵便番号検索画面');

/// メッセージプロバイダー(固定値)
final messageProvider = Provider((ref) => 'ハイフンなしで郵便番号を入力してね');

/// カウント監視プロバイダー
final countProvider = StateProvider((ref) => 0);
