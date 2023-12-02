import 'package:flutter/material.dart';

import 'recent_movie/recent_movie_view.dart';

class RecentMoviesSection extends StatelessWidget {
  final List<RecentMovieViewModelProtocol> recentMoviesViewModels;

  const RecentMoviesSection({required this.recentMoviesViewModels, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Text('Recentes'),
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: recentMoviesViewModels.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final viewModel = recentMoviesViewModels[index];

                return RecentMovieView(viewModel: viewModel);
              },
            ),
          ),
        ],
      ),
    );
  }
}
