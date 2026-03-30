import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum BudgetBadge { none, urgent, verified }

class BudgetListingCard extends StatelessWidget {
  const BudgetListingCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.location,
    required this.priceLabel,
    this.badge = BudgetBadge.none,
  });

  final String imageAsset;
  final String title;
  final String location;
  final String priceLabel;
  final BudgetBadge badge;

  static const double _imageWidth = 154;
  static const double _height = 122;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.text, width: 0.2),
        color: AppColors.homeBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: _height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: _imageWidth,
              child: Image.asset(imageAsset, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 14, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (badge != BudgetBadge.none) ...[
                      _Badge(badge: badge, textTheme: textTheme),
                      const SizedBox(height: 8),
                    ],
                    Text(
                      title,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSecondary,
                              fontSize: 12,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      priceLabel,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.badge, required this.textTheme});

  final BudgetBadge badge;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    if (badge == BudgetBadge.urgent) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: ShapeDecoration(
          color: AppColors.urgentBadgeBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(47),
          ),
        ),
        child: Text(
          'Urgent Filling',
          style: textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.urgentRed,
            fontSize: 10,
            height: 1.2,
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: ShapeDecoration(
        color: AppColors.verifiedBadgeBg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(47)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified_rounded,
            size: 12,
            color: AppColors.verifiedGreen,
          ),
          const SizedBox(width: 4),
          Text(
            'Verified',
            style: textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.verifiedGreen,
              fontSize: 10,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
