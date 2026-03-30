import 'package:flutter/material.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit user')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Image.asset(
              'assets/images/splash_hero.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
