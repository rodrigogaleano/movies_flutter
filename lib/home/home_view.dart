import 'package:flutter/material.dart';

import '../support/style/app_colors.dart';
import '../support/style/app_fonts.dart';
import 'components/recent_movie/recent_movie_view.dart';
import 'components/recent_movies_section.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get isLoading;
  String get errorMessage;

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
                SliverAppBar(
                  centerTitle: false,
                  title: Text(
                    'Movies', // TODO: Adicionar ao l10n
                    style: AppFonts.latoExtraBold(24, AppColors.black),
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
      RecentMoviesSection(
        recentMoviesViewModels: viewModel.recentMoviesViewModels,
      ),
    ];
  }
}
