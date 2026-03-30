import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.selected,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final bool selected;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final border = selected
        ? Border.all(color: AppColors.primary, width: 2)
        : Border.all(color: AppColors.roleCardBorder, width: 1);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: border,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 49,
            height: 49,
            decoration: const BoxDecoration(
              color: AppColors.roleIconCircle,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 26, color: AppColors.text),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.text,
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
