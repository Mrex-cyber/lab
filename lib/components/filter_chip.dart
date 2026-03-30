import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HomeFilterChip extends StatelessWidget {
  const HomeFilterChip({
    super.key,
    required this.label,
    required this.selected,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.2,
      color: selected ? AppColors.onPrimary : AppColors.textSecondary,
    );
    final iconColor = selected ? AppColors.onPrimary : AppColors.textSecondary;
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: selected ? AppColors.primary : const Color(0xFFFFFFFA),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: selected ? 0 : 0.2, color: AppColors.primary),
          borderRadius: BorderRadius.circular(34),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(width: 12),
          Icon(Icons.close, size: 15, color: iconColor),
        ],
      ),
    );
  }
}
