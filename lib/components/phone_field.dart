import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    this.label = 'Mobile Number',
    this.dialCode = '+91',
  });

  final String label;
  final String dialCode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final fieldStyle = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w400,
      color: AppColors.text,
      fontSize: 20,
      height: 1.2,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.text,
            fontSize: 16,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.5, color: AppColors.inputBorder),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(dialCode, style: fieldStyle),
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, color: AppColors.text, size: 22),
              const SizedBox(width: 8),
              Container(
                width: 1,
                height: 24,
                color: AppColors.inputBorder.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 24,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 1,
                      color: AppColors.inputBorder.withValues(alpha: 0.2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
