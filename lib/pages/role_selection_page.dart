import 'package:flutter/material.dart';

import '../components/role_card.dart';
import '../components/wide_cta_button.dart';
import '../routes/app_routes.dart';
import '../theme/app_colors.dart';
import '../utils/native_mobile.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = isNativeMobile();
    final size = MediaQuery.sizeOf(context);
    final horizontal = (size.width * 0.082).clamp(20.0, 40.0);
    final bottom = MediaQuery.paddingOf(context).bottom + 12;
    final textTheme = Theme.of(context).textTheme;

    final content = _buildContent(
      context,
      isMobile: isMobile,
      horizontal: horizontal,
      size: size,
      bottom: bottom,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 112,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'StayInn',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text,
                fontSize: 32,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, size: 22, color: AppColors.text),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'How will you use StayIn?',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.text,
                      fontSize: 20,
                      height: 1.25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: isMobile ? content : SingleChildScrollView(child: content),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required bool isMobile,
    required double horizontal,
    required Size size,
    required double bottom,
  }) {
    const cards = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RoleCard(
          selected: true,
          icon: Icons.location_on_rounded,
          title: 'I’m looking for a place to rent or buy',
          subtitle: 'Paying guests, apartments, flats',
        ),
        SizedBox(height: 16),
        RoleCard(
          selected: false,
          icon: Icons.home_rounded,
          title: 'I’m a property owner.',
          subtitle: 'List and manage properties through app',
        ),
        SizedBox(height: 16),
        RoleCard(
          selected: false,
          icon: Icons.groups_rounded,
          title: 'I’m a broker/agent.',
          subtitle: 'Manage Leads and earn commission by app',
        ),
      ],
    );

    void goHome() {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    }

    final footer = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        WideFilledButton(label: 'Continue', onPressed: goHome),
        const SizedBox(height: 12),
        WideOutlinedButton(label: 'Skip For Now', onPressed: goHome),
        SizedBox(height: bottom),
      ],
    );

    if (isMobile) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: size.height * 0.028),
            Expanded(child: SingleChildScrollView(child: cards)),
            footer,
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: size.height * 0.028),
          cards,
          footer,
        ],
      ),
    );
  }
}
