import 'package:flutter/material.dart';

import '../../../support/components/cached_image.dart';
import '../../../support/style/app_fonts.dart';

abstract class RecentMovieViewModelProtocol {
  String get title;
  String get posterPath;
}

class RecentMovieView extends StatelessWidget {
  // final bool isLastItem;
  // final bool isFirstItem;
  final RecentMovieViewModelProtocol viewModel;

  const RecentMovieView({
    required this.viewModel,
    // required this.isLastItem,
    // required this.isFirstItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedImage(
            imageUrl: viewModel.posterPath,
            width: 240,
            height: 360,
            borderRadius: 16,
          ),
          const SizedBox(height: 8),
          Text(
            viewModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.latoBold(20),
          ),
        ],
      ),
    );
  }
}
