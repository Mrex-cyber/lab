import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, this.hint = 'Search by street, city, state'});

  final String hint;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.2, color: AppColors.iconCircleBorder),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search_rounded, size: 20, color: AppColors.searchHint),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hint,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.searchHint,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
