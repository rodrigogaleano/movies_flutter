import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class DefaultBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const DefaultBackButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.black.withOpacity(0.5),
        ),
        child: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.white,
        ),
      ),
    );
  }
}
