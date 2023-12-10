import 'package:flutter/material.dart';

import '../../support/components/horizontal_movies_list.dart';
import '../../support/components/movie_item/movie_item_view.dart';
import 'section_title.dart';

class DefaultMoviesSection extends StatelessWidget {
  final String sectionTitle;
  final List<MovieItemViewModelProtocol> popularMoviesViewModels;

  const DefaultMoviesSection({
    required this.sectionTitle,
    required this.popularMoviesViewModels,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: sectionTitle),
          HorizontalMoviesList(viewModels: popularMoviesViewModels),
        ],
      ),
    );
  }
}
