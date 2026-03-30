import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  static const String _a1 = 'assets/images/home_listing_1.jpg';
  static const String _a2 = 'assets/images/home_listing_2.jpg';
  static const String _a3 = 'assets/images/splash_hero.jpg';

  static const String _bannerText =
      'Please keep all conversations respectful and professional at all times. Any inappropriate, offensive, or abusive behavior will not be tolerated.';

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
    final textTheme = Theme.of(context).textTheme;
    final horizontal = 22.0;

    final content = _buildContent(
      context,
      textTheme: textTheme,
      horizontal: horizontal,
    );

    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      appBar: AppBar(
        backgroundColor: AppColors.homeBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.text, width: 0.2),
            ),
            child: Icon(Icons.arrow_back, size: 18, color: AppColors.text),
          ),
        ),
        title: Text(
          'Contacts',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: AppColors.text,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Add People',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: content,
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required TextTheme textTheme,
    required double horizontal,
  }) {
    final listHeader = Text(
      'Saved Contacts(3)',
      style: textTheme.bodySmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
    );

    final tiles = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contactTile(
          textTheme,
          asset: _a1,
          name: 'Ram Kapoor',
          subtitle: 'Property Owner at Kapoor Properties',
        ),
        const SizedBox(height: 16),
        _contactTile(
          textTheme,
          asset: _a2,
          name: 'Sunita Sharma',
          subtitle: 'Unknown Properties',
        ),
        const SizedBox(height: 16),
        _contactTile(
          textTheme,
          asset: _a3,
          name: 'Amit Kumar',
          subtitle: 'Real Estate Broker',
        ),
      ],
    );

    final listBlock = Padding(
      padding: EdgeInsets.fromLTRB(horizontal + 3, 12, horizontal, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [listHeader, const SizedBox(height: 24), tiles],
      ),
    );

    final bottomPanel = SafeArea(
      top: false,
      minimum: EdgeInsets.zero,
      child: _buildBottomPanel(textTheme),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: SingleChildScrollView(child: listBlock)),
        bottomPanel,
      ],
    );
  }

  Widget _contactTile(
    TextTheme textTheme, {
    required String asset,
    required String name,
    required String subtitle,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 54,
      horizontalTitleGap: 12,
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: ClipOval(
        child: Image.asset(asset, width: 54, height: 54, fit: BoxFit.cover),
      ),
      title: Text(
        name,
        style: textTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.text,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          subtitle,
          style: textTheme.bodySmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
            height: 1.25,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPanel(TextTheme textTheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColors.background,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.2, color: AppColors.text),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        _a2,
                        width: 54,
                        height: 54,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sunita Kumari',
                            style: textTheme.titleMedium?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.text,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Property Owner at Kamala Residence',
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textSecondary,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.2, color: AppColors.text),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.download_rounded,
                      size: 16,
                      color: AppColors.text,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Save Contact',
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: const Color(0x0C2325A8),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.2, color: Color(0xFF2325A8)),
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 24,
                  color: const Color(0xFF2325A8),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _bannerText,
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      color: const Color(0xD82334A8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                      borderRadius: BorderRadius.circular(34),
                    ),
                  ),
                  child: Text(
                    'Send Message',
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                  ),
                  child: Text(
                    'Call Now',
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
