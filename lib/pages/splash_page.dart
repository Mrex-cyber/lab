import 'dart:async';

import 'package:flutter/material.dart';

import '../components/hero_photo.dart';
import '../components/onboarding_titles.dart';
import '../components/wide_cta_button.dart';
import '../routes/app_routes.dart';
import '../theme/app_colors.dart';
import '../utils/native_mobile.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const String _heroAsset = 'assets/images/splash_hero.jpg';

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _goToRegister);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goToRegister() {
    if (!mounted) {
      return;
    }
    _timer?.cancel();
    Navigator.of(context).pushReplacementNamed(AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = isNativeMobile();
    final size = MediaQuery.sizeOf(context);
    final horizontal = (size.width * 0.082).clamp(20.0, 40.0);
    final contentWidth = (size.width - 2 * horizontal).clamp(280.0, 400.0);
    final heroMaxH = size.height * 0.42;
    final textTheme = Theme.of(context).textTheme;

    final content = _buildContent(
      context,
      isMobile: isMobile,
      horizontal: horizontal,
      contentWidth: contentWidth,
      heroMaxH: heroMaxH,
      size: size,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'StayInn',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.text,
            fontSize: 32,
            height: 1.1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: _goToRegister,
              child: Text(
                'Skip',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.text,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
      body: isMobile ? content : SingleChildScrollView(child: content),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required bool isMobile,
    required double horizontal,
    required double contentWidth,
    required double heroMaxH,
    required Size size,
  }) {
    final hero = Center(
      child: HeroPhoto(
        assetPath: _heroAsset,
        maxWidth: contentWidth,
        maxHeight: heroMaxH,
      ),
    );
    const titles = OnboardingTitles(
      headline: 'Accommodation Listing just got easier',
      subtitle: 'Search. Filter. Find.',
    );
    final buttons = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WideFilledButton(label: 'Continue', onPressed: _goToRegister),
        const SizedBox(height: 12),
        WideOutlinedButton(
          label: 'Sign up',
          onPressed: () {
            _timer?.cancel();
            Navigator.of(context).pushReplacementNamed(AppRoutes.register);
          },
        ),
      ],
    );
    final bottomPad = SizedBox(
      height: MediaQuery.paddingOf(context).bottom + 12,
    );

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: size.height * 0.015),
            const Spacer(flex: 2),
            hero,
            SizedBox(height: size.height * 0.028),
            titles,
            const Spacer(flex: 3),
            buttons,
            bottomPad,
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          hero,
          SizedBox(height: size.height * 0.028),
          titles,
          const SizedBox(height: 32),
          buttons,
          bottomPad,
        ],
      ),
    );
  }
}
