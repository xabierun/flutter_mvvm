import 'package:flutter_mvvm/providers/home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel {
  late final WidgetRef ref;

  /// widgetRef setter
  WidgetRef set(WidgetRef setRef) => ref = setRef;

  /// title getter
  String get title => ref.read(titleProvider);
}
