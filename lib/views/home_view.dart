import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_models/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
    required this.viewModel,
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_viewModel.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_viewModel.message),
            Text(
              '${_viewModel.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildElevatedButton(Icons.add, _viewModel.countUp),
                  _buildElevatedButton(
                    Icons.restart_alt,
                    _viewModel.countReset,
                  ),
                  _buildElevatedButton(Icons.remove, _viewModel.countDown),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _viewModel.countUp,
        tooltip: '画面遷移',
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  ElevatedButton _buildElevatedButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: Icon(icon),
    );
  }
}
