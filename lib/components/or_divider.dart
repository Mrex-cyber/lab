import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key, this.label = 'or continue with'});

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final line = Expanded(
      child: Divider(height: 1, thickness: 0.5, color: AppColors.dividerLine),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        line,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.text,
              fontSize: 16,
            ),
          ),
        ),
        line,
      ],
    );
  }
}
