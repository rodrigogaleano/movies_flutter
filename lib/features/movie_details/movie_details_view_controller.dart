import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'movie_details_view.dart';

abstract class MovieDetailsProtocol extends MovieDetailsViewModelProtocol {
  void loadContent();

  VoidCallback? onTapBack;
}

class MovieDetailsViewController extends StatefulWidget {
  final int movieId;

  const MovieDetailsViewController({required this.movieId, super.key});

  @override
  State<MovieDetailsViewController> createState() => _MovieDetailsViewControllerState();
}

class _MovieDetailsViewControllerState extends State<MovieDetailsViewController> {
  late final MovieDetailsProtocol viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ServiceLocator.get<MovieDetailsProtocol>(param: widget.movieId);
    _bind();
    viewModel.loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetailsView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapBack = () {
      GoRouter.of(context).pop();
    };
  }
}
