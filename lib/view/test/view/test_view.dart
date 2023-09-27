import 'package:flutter/material.dart';
import 'package:mobx_counter/core/base/state/base_state.dart';
import 'package:mobx_counter/core/base/view/base_view.dart';
import 'package:mobx_counter/view/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: TestViewModel(),
      onModelReady: (value) {
        viewModel = value;
      },
      onPageBuilder: (context, value) {
        return Scaffold(
          body: Center(
            child: Observer(
              builder: (context) => Text(
                viewModel.counter.toString(),
                style: textTheme.titleLarge,
              ),
            ),
          ),
          floatingActionButton: floatingActionButton(),
        );
      },
    );
  }

  Column floatingActionButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () => viewModel.decrementCounter(),
          child: const Icon(Icons.remove_rounded),
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () => viewModel.incrementCounter(),
          child: const Icon(
            Icons.add_rounded,
          ),
        ),
      ],
    );
  }
}
