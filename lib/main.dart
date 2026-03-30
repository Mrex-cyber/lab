import 'package:flutter/material.dart';

import 'pages/contacts_page.dart';
import 'pages/create_account_page.dart';
import 'pages/home_page.dart';
import 'pages/role_selection_page.dart';
import 'pages/room_detail_page.dart';
import 'pages/splash_page.dart';
import 'pages/edit_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      //      home: const SplashPage(),
      //      home: const CreateAccountPage(),
      //      home: const HomePage(),
      //      home: const RoomDetailPage(),
      //      home: const ContactsPage(),
      //      home: const RoleSelectionPage(),
      home: const EditUserPage(),
    );
  }
}
