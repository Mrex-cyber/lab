import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/app_colors.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key, this.buttonSize = 49, this.gap = 32});

  final double buttonSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialCircle(
          size: buttonSize,
          child: FaIcon(
            FontAwesomeIcons.google,
            size: 20,
            color: const Color(0xFF4285F4),
          ),
        ),
        SizedBox(width: gap),
        _SocialCircle(
          size: buttonSize,
          child: const FaIcon(
            FontAwesomeIcons.apple,
            size: 22,
            color: Color(0xFF000000),
          ),
        ),
        SizedBox(width: gap),
        _SocialCircle(
          size: buttonSize,
          child: const FaIcon(
            FontAwesomeIcons.facebookF,
            size: 20,
            color: Color(0xFF1877F2),
          ),
        ),
      ],
    );
  }
}

class _SocialCircle extends StatelessWidget {
  const _SocialCircle({required this.size, required this.child});

  final double size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 0.2),
      ),
      child: child,
    );
  }
}
