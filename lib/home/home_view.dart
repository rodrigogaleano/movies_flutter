import 'package:flutter/material.dart';

import '../support/components/movie_item/movie_item_view.dart';
import '../support/style/app_colors.dart';
import '../support/style/app_fonts.dart';
import 'components/default_movies_section.dart';
import 'components/recent_movies_section.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get isLoading;
  String get errorMessage;

  List<MovieItemViewModelProtocol> get recentMoviesViewModels;
  List<MovieItemViewModelProtocol> get popularMoviesViewModels;
  List<MovieItemViewModelProtocol> get topRatedMoviesViewModels;
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
                SliverAppBar(
                  centerTitle: false,
                  title: Text(
                    'Movies', // TODO: Adicionar ao l10n
                    style: AppFonts.latoExtraBold(32, AppColors.black),
                  ),
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
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ];
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return [
        SliverFillRemaining(
          child: Center(
            child: Text(viewModel.errorMessage),
          ),
        )
      ];
    }

    return [
      RecentMoviesSection(recentMoviesViewModels: viewModel.recentMoviesViewModels),
      DefaultMoviesSection(
        sectionTitle: 'Populares',
        popularMoviesViewModels: viewModel.popularMoviesViewModels,
      ),
      DefaultMoviesSection(
        sectionTitle: 'Melhor avaliados ',
        popularMoviesViewModels: viewModel.topRatedMoviesViewModels,
      ),
    ];
  }
}
