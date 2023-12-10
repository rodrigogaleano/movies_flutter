import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'movie_item/movie_item_view.dart';

class AnimatedMoviesCarousel extends StatelessWidget {
  final List<MovieItemViewModelProtocol> viewModels;

  const AnimatedMoviesCarousel({required this.viewModels, super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 540,
        autoPlay: true,
        initialPage: 1,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
      ),
      items: viewModels.map((viewModel) {
        return MovieItemView(viewModel: viewModel);
      }).toList(),
    );
  }
}
