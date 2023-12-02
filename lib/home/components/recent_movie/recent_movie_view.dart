import 'package:flutter/material.dart';

import '../../../support/components/cached_image.dart';

abstract class RecentMovieViewModelProtocol {
  String get title;
  String get posterPath;
}

class RecentMovieView extends StatelessWidget {
  final RecentMovieViewModelProtocol viewModel;

  const RecentMovieView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedImage(
          imageUrl: viewModel.posterPath,
          height: 400,
        ),
        Text(viewModel.title),
      ],
    );
  }
}
