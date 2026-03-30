import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class BrandTitle extends StatelessWidget {
  const BrandTitle({super.key, this.fontSize = 32});

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'StayInn',
      style: textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.text,
        fontSize: fontSize,
        height: 1.1,
      ),
    );
  }
}
