import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_models/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mogemoge = StateProvider((ref) => 'null');

class HomeView extends ConsumerStatefulWidget {
  const HomeView(
    this.viewModel, {
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;
    _viewModel.ref = ref;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_viewModel.title)),
    );
  }
}
