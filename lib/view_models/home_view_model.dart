import 'package:flutter_mvvm/providers/home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel {
  HomeViewModel(this.ref);

  late final WidgetRef ref;

  /// タイトル
  String get title => ref.read(titleProvider);

  /// メッセージ
  String get message => ref.read(messageProvider);

  /// カウント
  int get count => ref.watch(countProvider);

  /// カウントアップ関数
  void countUp() {
    ref.read(countProvider.notifier).update((state) => state + 1);
  }

  /// カウントダウン関数
  void countDown() {
    ref.read(countProvider.notifier).update((state) => state - 1);
  }

  /// カウントリセット関数
  void countReset() {
    ref.read(countProvider.notifier).update((state) => 0);
  }
}
