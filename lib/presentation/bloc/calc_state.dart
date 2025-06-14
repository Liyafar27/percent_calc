import 'package:flutter/material.dart';
import 'package:percent_calc/models/history_entry.dart';

class CalcState {
  final double? value;
  final double? percent;
  final double? result;
  final ThemeMode themeMode;
  final Locale locale;
  final String? errorMessage;
  final List<MapEntry<dynamic, HistoryEntry>> history;

  const CalcState({
    this.value,
    this.percent,
    this.result,
    this.errorMessage,
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en'),
    this.history = const [],
  });

  CalcState copyWith({
    double? value,
    double? percent,
    double? result,
    String? errorMessage,
    ThemeMode? themeMode,
    Locale? locale,
    final List<MapEntry<dynamic, HistoryEntry>>? history,
  }) {
    return CalcState(
      value: value ?? this.value,
      percent: percent ?? this.percent,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      history: history ?? this.history,
    );
  }
}
