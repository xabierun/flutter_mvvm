import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_models/home_view_model.dart';
import 'package:flutter_mvvm/views/home_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppNavigator extends ConsumerStatefulWidget {
  const AppNavigator({
    super.key,
  });

  @override
  ConsumerState<AppNavigator> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<AppNavigator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 画面情報を全てここで登録するためにMaterialAppの呼び出しは原則一回
    return MaterialApp(
      // 初期画面を設定
      initialRoute: '/home',
      // router
      routes: {
        '/home': (context) => HomeView(HomeViewModel()), // ホーム画面
      },
      // アプリ全体のテーマカラー
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
