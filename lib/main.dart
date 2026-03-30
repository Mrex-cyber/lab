import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/contacts_page.dart';
import 'pages/create_account_page.dart';
import 'pages/home_page.dart';
import 'pages/role_selection_page.dart';
import 'pages/room_detail_page.dart';
import 'pages/splash_page.dart';
import 'routes/app_routes.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StayInn',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(),
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashPage(),
        AppRoutes.register: (_) => const CreateAccountPage(),
        AppRoutes.home: (_) => const HomePage(),
        AppRoutes.details: (_) => const RoomDetailPage(),
        AppRoutes.contacts: (_) => const ContactsPage(),
        AppRoutes.role: (_) => const RoleSelectionPage(),
      },
    );
  }
}
