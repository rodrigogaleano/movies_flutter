import 'package:flutter/material.dart';

import '../../support/components/animated_movies_carousel.dart';
import '../../support/components/movie_item/movie_item_view.dart';
import 'section_title.dart';

class RecentMoviesSection extends StatelessWidget {
  final List<MovieItemViewModelProtocol> recentMoviesViewModels;

  const RecentMoviesSection({required this.recentMoviesViewModels, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionTitle(title: 'Recentes'),
          AnimatedMoviesCarousel(viewModels: recentMoviesViewModels),
        ],
      ),
    );
  }
}
