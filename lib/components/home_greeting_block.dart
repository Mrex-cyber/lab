import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HomeGreetingBlock extends StatelessWidget {
  const HomeGreetingBlock({
    super.key,
    this.greetingLine = 'Good Morning, Rahul ',
    this.headline = 'Find your perfect place today!',
  });

  final String greetingLine;
  final String headline;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          greetingLine,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          headline,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.text,
            fontSize: 24,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
