// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import 'package:percent_calc/main.dart';
import 'package:percent_calc/models/history_entry.dart';
class MockHistoryBox extends Mock implements Box<HistoryEntry> {}

void main() {

      testWidgets('App builds with mocked Hive box', (WidgetTester tester) async {
      final mockBox = MockHistoryBox();
      when(() => mockBox.toMap()).thenReturn({});
      when(() => mockBox.isOpen).thenReturn(true);
      when(() => mockBox.values).thenReturn([]);

      await tester.pumpWidget(
        MainApp(historyBox: mockBox),
      );
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  }