import 'package:flutter/material.dart';

import '../components/budget_listing_card.dart';
import '../components/filter_chip.dart';
import '../components/floating_bottom_nav.dart';
import '../components/home_greeting_block.dart';
import '../components/home_search_bar.dart';
import '../components/home_top_bar.dart';
import '../components/section_header_row.dart';
import '../components/top_pick_card.dart';
import '../routes/app_routes.dart';
import '../theme/app_colors.dart';
import '../utils/native_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String _listingA = 'assets/images/home_listing_1.jpg';
  static const String _listingB = 'assets/images/home_listing_2.jpg';

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
    final horizontal = (MediaQuery.sizeOf(context).width * 0.055).clamp(
      20.0,
      32.0,
    );
    final bottomInset = MediaQuery.paddingOf(context).bottom + 16;

    final content = _buildContent(
      context,
      isMobile: isMobile,
      horizontal: horizontal,
      bottomInset: bottomInset,
    );

    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      appBar: AppBar(
        backgroundColor: AppColors.homeBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        titleSpacing: horizontal,
        title: const HomeTopBar(),
      ),
      body: isMobile ? content : SingleChildScrollView(child: content),
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required bool isMobile,
    required double horizontal,
    required double bottomInset,
  }) {
    final scrollBody = Padding(
      padding: EdgeInsets.fromLTRB(
        horizontal,
        12,
        horizontal,
        bottomInset + 88,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const HomeGreetingBlock(),
          const SizedBox(height: 16),
          const HomeSearchBar(),
          const SizedBox(height: 20),
          SizedBox(
            height: 42,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                HomeFilterChip(label: 'All', selected: true),
                SizedBox(width: 8),
                HomeFilterChip(label: 'Furnished', selected: false),
                SizedBox(width: 8),
                HomeFilterChip(label: 'Boys', selected: false),
                SizedBox(width: 8),
                HomeFilterChip(label: 'AC', selected: false),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const SectionHeaderRow(title: 'Top picks for you'),
          const SizedBox(height: 12),
          SizedBox(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.details);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: TopPickCard(
                      imageAsset: _listingA,
                      title: 'Kamla Residence',
                      location: 'Near Janakpuri Metro Station',
                      priceLabel: '₹ 9000pmo',
                      tags: const ['Furnished', 'Wifi', 'Food'],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.details);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: TopPickCard(
                      imageAsset: _listingB,
                      title: 'Kamla Residence',
                      location: 'Near Shashtri Nagar Metro Station',
                      priceLabel: '₹ 23000pmo',
                      tags: const ['Furnished', 'Wifi', 'Air conditioned'],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const SectionHeaderRow(title: 'Budget Friendly '),
          const SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.details);
              },
              borderRadius: BorderRadius.circular(10),
              child: BudgetListingCard(
                imageAsset: _listingA,
                title: '2 BHK Flat ',
                location: 'HSR Layout, Uttam Nagar',
                priceLabel: '₹ 12000pmo',
                badge: BudgetBadge.urgent,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.details);
              },
              borderRadius: BorderRadius.circular(10),
              child: BudgetListingCard(
                imageAsset: _listingB,
                title: '2 BHK Flat ',
                location: 'HSR Layout, Uttam Nagar',
                priceLabel: '₹ 12000pmo',
                badge: BudgetBadge.verified,
              ),
            ),
          ),
          if (!isMobile) ...[
            SizedBox(height: bottomInset + 16),
            const Center(child: FloatingBottomNav()),
          ],
        ],
      ),
    );

    if (isMobile) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          scrollBody,
          Positioned(
            left: 0,
            right: 0,
            bottom: bottomInset - 8,
            child: const Center(child: FloatingBottomNav()),
          ),
        ],
      );
    }

    return scrollBody;
  }
}
