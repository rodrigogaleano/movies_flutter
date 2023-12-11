import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../cached_image.dart';

abstract class MovieItemViewModelProtocol {
  String get title;
  bool get isLastItem;
  bool get isFirstItem;
  String get posterPath;

  void didTapMovie();
}

class MovieItemView extends StatelessWidget {
  final MovieItemViewModelProtocol viewModel;

  const MovieItemView({
    required this.viewModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: viewModel.didTapMovie,
      child: Container(
        width: 300,
        margin: EdgeInsets.only(
          left: viewModel.isFirstItem ? 24 : 20,
          right: viewModel.isLastItem ? 24 : 0,
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
                width: 304,
                height: 458,
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
      ),
    );
  }
}
