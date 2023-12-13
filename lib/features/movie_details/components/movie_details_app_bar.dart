import 'package:flutter/material.dart';

import '../../../support/components/cached_image.dart';
import '../../../support/components/default_back_button.dart';
import '../../../support/style/app_colors.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final String backdropPath;
  final VoidCallback onTapBack;

  const MovieDetailsAppBar({required this.backdropPath, required this.onTapBack, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      leading: DefaultBackButton(onTap: onTapBack),
      flexibleSpace: FlexibleSpaceBar(
        background: CachedImage(imageUrl: backdropPath),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 24,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
      ),
    );
  }
}
