import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RoleQuestionHeader extends StatelessWidget {
  const RoleQuestionHeader({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(Icons.arrow_back, size: 22, color: AppColors.text),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            question,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.text,
              fontSize: 20,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}
