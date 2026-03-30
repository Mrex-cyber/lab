import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({
    super.key,
    required this.title,
    required this.subtitle,
    this.gap = 4,
  });

  final String title;
  final String subtitle;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.text,
            fontSize: 20,
            height: 1.25,
          ),
        ),
        SizedBox(height: gap),
        Text(
          subtitle,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
