import 'package:flutter/material.dart';

import '../../support/components/cached_image.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

abstract class MovieDetailsViewModelProtocol with ChangeNotifier {
  String get title;
  bool get isLoading;
  String get errorMessage;
  String get backdropPath;
  String get overview;
}

class MovieDetailsView extends StatelessWidget {
  final MovieDetailsViewModelProtocol viewModel;

  const MovieDetailsView({required this.viewModel, super.key});

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
      SliverAppBar(
        expandedHeight: 300,
        flexibleSpace: FlexibleSpaceBar(
          background: CachedImage(imageUrl: viewModel.backdropPath),
        ),
      ),
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
