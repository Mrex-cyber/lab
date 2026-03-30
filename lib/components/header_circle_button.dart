import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HeaderCircleButton extends StatelessWidget {
  const HeaderCircleButton({
    super.key,
    required this.icon,
    this.size = 36,
    this.iconSize = 22,
    this.padding = const EdgeInsets.all(4),
  });

  final IconData icon;
  final double size;
  final double iconSize;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: padding,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.2, color: AppColors.iconCircleBorder),
          borderRadius: BorderRadius.circular(19.5),
        ),
      ),
      child: Icon(icon, size: iconSize, color: AppColors.locationPrimary),
    );
  }
}
