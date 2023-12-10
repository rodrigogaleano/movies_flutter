import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../../support/components/movie_item/movie_item_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/service_locator/service_locator.dart';
import 'components/default_movies_section.dart';
import 'components/recent_movies_section.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get isLoading;
  String get errorMessage;

  List<MovieItemViewModelProtocol> get recentMoviesViewModels;
  List<MovieItemViewModelProtocol> get popularMoviesViewModels;
  List<MovieItemViewModelProtocol> get topRatedMoviesViewModels;
  List<MovieItemViewModelProtocol> get upcomingMoviesViewModels;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;
  final l10n = ServiceLocator.get<LocalizeProtocol>().l10n;

  HomeView({required this.viewModel, super.key});

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
                    l10n.appTitle,
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
        sectionTitle: l10n.popularMoviesSectionLabel,
        popularMoviesViewModels: viewModel.popularMoviesViewModels,
      ),
      DefaultMoviesSection(
        sectionTitle: l10n.topRatedMoviesSectionLabel,
        popularMoviesViewModels: viewModel.topRatedMoviesViewModels,
      ),
      DefaultMoviesSection(
        sectionTitle: l10n.upComingMoviesSectionLabel,
        popularMoviesViewModels: viewModel.upcomingMoviesViewModels,
      ),
    ];
  }
}
