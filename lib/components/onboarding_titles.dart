import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OnboardingTitles extends StatelessWidget {
  const OnboardingTitles({
    super.key,
    required this.headline,
    required this.subtitle,
    this.gap = 8,
  });

  final String headline;
  final String subtitle;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final base = textTheme.titleLarge?.copyWith(
      color: AppColors.text,
      fontSize: 20,
      height: 1.25,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          headline,
          textAlign: TextAlign.center,
          style: base?.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: gap),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: base?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
