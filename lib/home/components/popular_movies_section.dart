import 'package:flutter/material.dart';

import '../../support/components/horizontal_movies_list/horizontal_movies_list.dart';
import '../../support/components/movie_item/movie_item_view.dart';
import 'section_title.dart';

class PopularMoviesSection extends StatelessWidget {
  final List<MovieItemViewModelProtocol> popularMoviesViewModels;

  const PopularMoviesSection({
    required this.popularMoviesViewModels,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Populares'),
          HorizontalMoviesList(viewModels: popularMoviesViewModels),
        ],
      ),
    );
  }
}
