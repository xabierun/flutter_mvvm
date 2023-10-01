import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/utils/size_config.dart';
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
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_viewModel.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _viewModel.message,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Form(
              key: _viewModel.formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 50,
                      maxWidth: SizeConfig.blockSizeHorizontal! * 80,
                    ),
                    margin: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 7,
                      validator: _viewModel.postalVaridator,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '1000000',
                        prefixIcon: Icon(Icons.local_post_office_outlined),
                      ),
                      initialValue: '1000000',
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _viewModel.submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Icon(Icons.send),
                    ),
                  ),
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
}
