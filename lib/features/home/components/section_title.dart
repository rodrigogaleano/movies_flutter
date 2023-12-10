import 'package:flutter/material.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Text(
        title,
        style: AppFonts.latoBold(28, AppColors.black),
      ),
    );
  }
}
