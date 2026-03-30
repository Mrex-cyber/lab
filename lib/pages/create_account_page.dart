import 'package:flutter/material.dart';

import '../components/or_divider.dart';
import '../components/phone_field.dart';
import '../components/social_login_row.dart';
import '../components/terms_agreement_text.dart';
import '../components/welcome_heading.dart';
import '../components/wide_cta_button.dart';
import '../routes/app_routes.dart';
import '../theme/app_colors.dart';
import '../utils/native_mobile.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  void _goHome() {
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  }

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
    final content = _buildContent(context, horizontal, size);

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
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.text,
            fontSize: 32,
            height: 1.1,
          ),
        ),
      ),
      body: isMobile
          ? SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: content,
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: content,
            ),
    );
  }

  Widget _buildContent(BuildContext context, double horizontal, Size size) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontal,
        size.height * 0.015,
        horizontal,
        MediaQuery.paddingOf(context).bottom + 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: size.height * 0.028),
          const WelcomeHeading(
            title: 'Welcome to StayInn! ',
            subtitle: 'Create an account to get started.',
          ),
          SizedBox(height: size.height * 0.032),
          const PhoneField(),
          const SizedBox(height: 16),
          const TermsAgreementText(),
          const SizedBox(height: 32),
          WideFilledButton(label: 'Continue', onPressed: _goHome),
          SizedBox(height: size.height * 0.028),
          const OrDivider(),
          const SizedBox(height: 24),
          const SocialLoginRow(),
        ],
      ),
    );
  }
}
