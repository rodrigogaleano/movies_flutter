import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/service_locator/service_locator.dart';
import 'components/movie_details_app_bar.dart';

abstract class MovieDetailsViewModelProtocol with ChangeNotifier {
  bool get isLoading;

  String get title;
  String get genres;
  String get runtime;
  String get overview;
  String get releaseYear;
  String get voteAverage;
  String get errorMessage;
  String get backdropPath;

  double get voteAverageValue;
}

class MovieDetailsView extends StatelessWidget {
  final MovieDetailsViewModelProtocol viewModel;
  final l10n = ServiceLocator.get<LocalizeProtocol>().l10n;

  MovieDetailsView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, __) {
            return CustomScrollView(
              slivers: _bodyWidgets,
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
          child: Center(child: CircularProgressIndicator()),
        ),
      ];
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return [
        SliverFillRemaining(
          child: Center(
            child: Text(
              viewModel.errorMessage,
            ),
          ),
        ),
      ];
    }

    return [
      MovieDetailsAppBar(backdropPath: viewModel.backdropPath),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                viewModel.title,
                style: AppFonts.latoBold(26, AppColors.black),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.genres,
                          style: AppFonts.latoRegular(16, AppColors.black),
                        ),
                        Text(
                          l10n.movieRuntimeLabel(viewModel.runtime),
                          style: AppFonts.latoRegular(16, AppColors.black),
                        ),
                        Text(
                          viewModel.releaseYear,
                          style: AppFonts.latoRegular(16, AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: viewModel.voteAverageValue,
                          backgroundColor: AppColors.black.withOpacity(0.1),
                        ),
                      ),
                      Text(viewModel.voteAverage),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                viewModel.overview,
                style: AppFonts.latoRegular(16, AppColors.black),
              )
            ],
          ),
        ),
      )
    ];
  }
}
