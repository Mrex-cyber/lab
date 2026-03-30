import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab3/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('EditUserPage shows hero', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Edit user'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
