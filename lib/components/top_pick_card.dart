import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TopPickCard extends StatelessWidget {
  const TopPickCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.location,
    required this.priceLabel,
    required this.tags,
  });

  final String imageAsset;
  final String title;
  final String location;
  final String priceLabel;
  final List<String> tags;

  static const double _width = 205;
  static const double _imageHeight = 249;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: _width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.text, width: 0.2),
        color: AppColors.homeBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: _imageHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                  width: _width,
                  height: _imageHeight,
                ),
                Positioned(
                  top: 11,
                  left: 12,
                  right: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColors.verifiedBadgeBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(47),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.verified_rounded,
                              size: 14,
                              color: AppColors.verifiedGreen,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Verified',
                              style: textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.verifiedGreen,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.text,
                            width: 0.12,
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite_border_rounded,
                          size: 14,
                          color: AppColors.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 4, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: tags
                      .map(
                        (t) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: ShapeDecoration(
                            color: AppColors.tagPillBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(47),
                            ),
                          ),
                          child: Text(
                            t,
                            style: textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.text,
                              fontSize: 10,
                              height: 1.2,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
