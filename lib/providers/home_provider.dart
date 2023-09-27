import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) => 'Flutter Demo Home Page');
final messageProvider =
    Provider((ref) => 'You have pushed the button this many times:');
final countProvider = StateProvider((ref) => 0);
