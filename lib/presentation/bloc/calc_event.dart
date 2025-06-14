import 'package:flutter/material.dart';

abstract class CalcEvent {}

class CalculatePressed extends CalcEvent {
  final double value;
  final double percent;

  CalculatePressed(this.value, this.percent);
}

class ResetPressed extends CalcEvent {}

class ChangeTheme extends CalcEvent {
  final ThemeMode themeMode;
  ChangeTheme(this.themeMode);
}

class ChangeLocale extends CalcEvent {
  final Locale locale;
  ChangeLocale(this.locale);
}
class LoadHistory extends CalcEvent {}
class DeleteHistoryEntry extends CalcEvent {
  final int key; // Hive key
  DeleteHistoryEntry(this.key);
}
class ClearHistory extends CalcEvent {}