import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'header_circle_button.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key, this.locationLine = 'New Delhi, DL, IN'});

  final String locationLine;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                locationLine,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.locationPrimary,
                  fontSize: 14,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.my_location, size: 14, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Text(
                      'Fetch My Location',
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                        fontSize: 12,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const HeaderCircleButton(icon: Icons.tune_rounded, iconSize: 20),
        const SizedBox(width: 16),
        const HeaderCircleButton(
          icon: Icons.notifications_none_rounded,
          iconSize: 20,
        ),
        const SizedBox(width: 16),
        const HeaderCircleButton(
          icon: Icons.favorite_border_rounded,
          iconSize: 18,
        ),
      ],
    );
  }
}
