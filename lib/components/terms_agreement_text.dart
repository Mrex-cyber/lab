import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class TermsAgreementText extends StatelessWidget {
  const TermsAgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final base = textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w400,
      color: AppColors.text,
      fontSize: 12,
      height: 1.4,
    );
    final link = base?.copyWith(color: AppColors.primary);
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          const TextSpan(text: 'By continuing you agree to our '),
          TextSpan(text: 'Terms & Conditions', style: link),
          const TextSpan(text: ' and '),
          TextSpan(text: 'Privacy Policy.', style: link),
        ],
      ),
    );
  }
}
