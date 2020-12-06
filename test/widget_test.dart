import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_and_care/ui/activity_screen.dart';

void main() {
  testWidgets('Enter duration 2020', (WidgetTester tester) async {
    final addField = find.byKey(ValueKey('Enter duration'));

    await tester.pumpWidget(MaterialApp(home: ActivityPage()));

    await tester.enterText(addField, '2020');

    await tester.pump();

    expect(find.text('2020'), findsOneWidget);
  });

  testWidgets('Add Activity button', (WidgetTester tester) async {
    final addButton = find.byKey(ValueKey('Add Activity'));

    await tester.pumpWidget(MaterialApp(home: ActivityPage()));

    await tester.tap(addButton);

    await tester.pump();

    expect(find.text(''), findsOneWidget);
  });
}
