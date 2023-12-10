import 'package:flutter/material.dart';

import '../../../support/components/cached_image.dart';
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
          CachedImage(
            imageUrl: viewModel.posterPath,
            borderRadius: 16,
          ),
          const SizedBox(height: 8),
          Text(
            viewModel.title,
            maxLines: 2,
            style: AppFonts.latoBold(20),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
