import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    super.key,
    required this.title,
    this.skipLabel = 'Skip',
    this.titleStyle,
    this.skipStyle,
  });

  final String title;
  final String skipLabel;
  final TextStyle? titleStyle;
  final TextStyle? skipStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              titleStyle ??
              textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
                fontSize: 32,
                height: 1.1,
              ),
        ),
        Text(
          skipLabel,
          style:
              skipStyle ??
              textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.text,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
