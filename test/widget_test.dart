import 'package:flutter_test/flutter_test.dart';

import 'package:lab3/main.dart';

void main() {
  testWidgets('splash shows StayInn and actions', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('StayInn'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);
  });
}
