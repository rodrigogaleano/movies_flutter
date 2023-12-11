import 'package:flutter/material.dart';

abstract class MovieDetailsViewModelProtocol with ChangeNotifier {}

class MovieDetailsView extends StatelessWidget {
  final MovieDetailsViewModelProtocol viewModel;

  const MovieDetailsView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
