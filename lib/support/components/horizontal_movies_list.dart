import 'package:flutter/material.dart';

import 'movie_item/movie_item_view.dart';

class HorizontalMoviesList extends StatelessWidget {
  final List<MovieItemViewModelProtocol> viewModels;

  const HorizontalMoviesList({required this.viewModels, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ListView.builder(
        itemCount: viewModels.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final currentViewModel = viewModels[index];

          return MovieItemView(viewModel: currentViewModel);
        },
      ),
    );
  }
}
