import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/view_models/postal_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostalView extends ConsumerStatefulWidget {
  const PostalView({
    super.key,
  });

  @override
  ConsumerState<PostalView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<PostalView> {
  late PostalViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PostalViewModel(ref);
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
            Form(
              child: TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 7,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '空だよ';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '1000000',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildElevatedButton(
                    Icons.restart_alt,
                    _viewModel.countReset,
                  ),
                  _buildElevatedButton(Icons.send, _viewModel.countDown),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
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
