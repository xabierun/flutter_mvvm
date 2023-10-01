import 'package:flutter/material.dart';
import 'package:flutter_mvvm/providers/postal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostalViewModel {
  PostalViewModel(this.ref);
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final WidgetRef ref;

  /// widgetRef setter
  WidgetRef set(WidgetRef setRef) => ref = setRef;

  /// タイトル
  String get title => ref.read(titleProvider);

  /// メッセージ
  String get message => ref.read(messageProvider);

  /// カウント
  int get count => ref.watch(countProvider);

  TextEditingController get textController => _textController;
  GlobalKey<FormState> get formKey => _formKey;

  String? postalVaridator(String? value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    if (value.length < 7) {
      return '7文字入力してください';
    }
    return null;
  }

  void submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
      // 送信処理追加
    }
  }
}
