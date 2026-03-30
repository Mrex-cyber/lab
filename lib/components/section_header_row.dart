import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SectionHeaderRow extends StatelessWidget {
  const SectionHeaderRow({
    super.key,
    required this.title,
    this.actionLabel = 'See more',
  });

  final String title;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.text,
            fontSize: 16,
            height: 1.25,
          ),
        ),
        Text(
          actionLabel,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
