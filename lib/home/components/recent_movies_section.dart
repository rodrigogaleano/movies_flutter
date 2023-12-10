import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../../support/components/animated_movies_carousel.dart';
import '../../support/components/movie_item/movie_item_view.dart';
import '../../support/utils/service_locator/service_locator.dart';
import 'section_title.dart';

class RecentMoviesSection extends StatelessWidget {
  final List<MovieItemViewModelProtocol> recentMoviesViewModels;

  const RecentMoviesSection({required this.recentMoviesViewModels, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = ServiceLocator.get<LocalizeProtocol>().l10n;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionTitle(title: l10n.recentMoviesSectionLabel),
          AnimatedMoviesCarousel(viewModels: recentMoviesViewModels),
        ],
      ),
    );
  }
}
