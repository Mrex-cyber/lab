import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class WideFilledButton extends StatelessWidget {
  const WideFilledButton({
    super.key,
    required this.label,
    this.minHeight = 52,
    this.onPressed,
  });

  final String label;
  final double minHeight;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final child = SizedBox(
      width: double.infinity,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: ShapeDecoration(
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
        ),
        child: Text(
          label,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.onPrimary,
            fontSize: 20,
          ),
        ),
      ),
    );
    if (onPressed == null) {
      return child;
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(34),
        child: child,
      ),
    );
  }
}

class WideOutlinedButton extends StatelessWidget {
  const WideOutlinedButton({
    super.key,
    required this.label,
    this.minHeight = 52,
    this.onPressed,
  });

  final String label;
  final double minHeight;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final child = SizedBox(
      width: double.infinity,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(34),
          ),
        ),
        child: Text(
          label,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
            fontSize: 20,
          ),
        ),
      ),
    );
    if (onPressed == null) {
      return child;
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(34),
        child: child,
      ),
    );
  }
}
