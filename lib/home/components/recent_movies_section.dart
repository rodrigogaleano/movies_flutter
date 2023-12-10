import 'package:flutter/material.dart';

import '../../support/style/app_fonts.dart';
import 'recent_movie/recent_movie_view.dart';
import 'recent_movies_carousel/recent_movies_carousel.dart';

class RecentMoviesSection extends StatelessWidget {
  final List<RecentMovieViewModelProtocol> recentMoviesViewModels;

  const RecentMoviesSection({required this.recentMoviesViewModels, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Recentes',
              style: AppFonts.latoBold(20),
            ),
          ),
          RecentMovieCarousel(recentMoviesViewModels: recentMoviesViewModels),
        ],
      ),
    );
  }
}
