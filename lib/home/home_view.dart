import 'package:flutter/material.dart';

import 'components/recent_movie/recent_movie_view.dart';
import 'components/recent_movies_section.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get isLoading;

  List<RecentMovieViewModelProtocol> get recentMoviesViewModels;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, __) {
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('Movies'),
                ),
                ..._bodyWidgets,
              ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> get _bodyWidgets {
    if (viewModel.isLoading) {
      return [
        const SliverFillRemaining(
          child: CircularProgressIndicator(),
        ),
      ];
    }

    return [
      RecentMoviesSection(
        recentMoviesViewModels: viewModel.recentMoviesViewModels,
      ),
    ];
  }
}
