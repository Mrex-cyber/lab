import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 320),
      padding: const EdgeInsets.fromLTRB(4, 4, 6, 4),
      decoration: ShapeDecoration(
        color: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home_rounded,
                  size: 18,
                  color: AppColors.floatNavLabel,
                ),
                const SizedBox(width: 8),
                Text(
                  'Home',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 1.25,
                    letterSpacing: 0.1,
                    color: AppColors.floatNavLabel,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _NavCircle(icon: Icons.search_rounded),
          const SizedBox(width: 8),
          _NavCircle(icon: Icons.people_outline_rounded),
          const SizedBox(width: 8),
          _NavCircle(icon: Icons.chat_bubble_outline_rounded),
        ],
      ),
    );
  }
}

class _NavCircle extends StatelessWidget {
  const _NavCircle({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        color: AppColors.floatNavIconBg,
        shape: CircleBorder(),
      ),
      child: Icon(icon, size: 22, color: Colors.white),
    );
  }
}
