// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of wimport 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathernow/main.dart';

void main() {
  testWidgets('App loads without errors', (WidgetTester tester) async {
    // Build the WeatherNowApp within ProviderScope.
    await tester.pumpWidget(const ProviderScope(child: WeatherNowApp()));
    await tester.pumpAndSettle();
    // Verify that the app's title is present.
    expect(find.text('WeatherNow'), findsOneWidget);
  });
}
