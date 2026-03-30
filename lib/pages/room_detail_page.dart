import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/native_mobile.dart';

class RoomDetailPage extends StatefulWidget {
  const RoomDetailPage({super.key});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  static const String _heroAsset = 'assets/images/home_listing_1.jpg';

  static const List<String> _amenities = [
    'Furnished',
    'Wifi',
    'Food',
    'No Gate Timings',
    'Laundry',
    'Pet Allowed',
    'Security Deposit',
    'Co-living Allowed',
  ];

  static const String _description =
      'Our PG is located in Janakpuri and offers a total of 25 rooms. Currently, one double-sharing room with two beds is available. The room is expected to be occupied within the next two weeks.\n'
      'The property is conveniently located near the college, and most of our tenants are college students. Working professionals are also welcome.\n'
      'For more details or to schedule a visit, please contact us.';

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
    final content = _buildContent(context, isMobile: isMobile);

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: isMobile ? content : SingleChildScrollView(child: content),
    );
  }

  Widget _buildContent(BuildContext context, {required bool isMobile}) {
    final textTheme = Theme.of(context).textTheme;
    final horizontal = 20.0;
    final topPad = MediaQuery.paddingOf(context).top;

    final scrollPart = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHero(context, textTheme, topPad),
        _buildDetails(context, textTheme, horizontal),
      ],
    );

    final bottomBar = _buildBottomBar(textTheme);

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: SingleChildScrollView(child: scrollPart)),
          bottomBar,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [scrollPart, bottomBar],
    );
  }

  Widget _buildHero(BuildContext context, TextTheme textTheme, double topPad) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
          aspectRatio: 402 / 340,
          child: Image.asset(
            _heroAsset,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: topPad + 12,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.text, width: 0.5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back, size: 16, color: AppColors.text),
                        const SizedBox(width: 6),
                        Text(
                          'Go Back',
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: AppColors.text,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.text, width: 0.5),
                ),
                child: Icon(
                  Icons.favorite_border_rounded,
                  size: 18,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 9,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(29),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.text.withValues(alpha: 0.35),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.text.withValues(alpha: 0.35),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(
    BuildContext context,
    TextTheme textTheme,
    double horizontal,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(horizontal, 20, horizontal, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kamla Residence',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: AppColors.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Near Janakpuri Metro Station',
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹ 9000pmo',
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '4.5',
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 10,
                      color: AppColors.text,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Icon(Icons.star_rounded, size: 14, color: AppColors.primary),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _amenities
                .map(
                  (label) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.tagPillBg,
                      borderRadius: BorderRadius.circular(47),
                    ),
                    child: Text(
                      label,
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.text,
                        height: 1.2,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Room Description',
            style: textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _description,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12,
              height: 1.45,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        border: Border.all(color: AppColors.text, width: 0.1),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '₹ 9000pmo',
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    '(negotiable)',
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Text(
                'Contact Owner',
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
