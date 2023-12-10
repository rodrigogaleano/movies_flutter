import 'package:flutter/material.dart';

import '../../../support/components/cached_image.dart';
import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';

abstract class RecentMovieViewModelProtocol {
  String get title;
  bool get isLastItem;
  bool get isFirstItem;
  String get posterPath;
}

class RecentMovieView extends StatelessWidget {
  final RecentMovieViewModelProtocol viewModel;

  const RecentMovieView({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: viewModel.isFirstItem ? 0 : 12,
        right: viewModel.isLastItem ? 0 : 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: CachedImage(
              imageUrl: viewModel.posterPath,
              borderRadius: 16,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            viewModel.title,
            maxLines: 2,
            style: AppFonts.latoBold(20, AppColors.black),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
