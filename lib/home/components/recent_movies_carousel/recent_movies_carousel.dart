import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../recent_movie/recent_movie_view.dart';

class RecentMovieCarousel extends StatelessWidget {
  final List<RecentMovieViewModelProtocol> recentMoviesViewModels;

  const RecentMovieCarousel({required this.recentMoviesViewModels, super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 540,
        initialPage: 1,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
      ),
      items: recentMoviesViewModels.map((viewModel) {
        return RecentMovieView(viewModel: viewModel);
      }).toList(),
    );
  }
}
