import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:percent_calc/models/history_entry.dart';
import 'calc_state.dart';
import 'calc_event.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  final Box<HistoryEntry> historyBox;

  CalcBloc(this.historyBox) : super(const CalcState()) {
    on<CalculatePressed>(_onCalculate);
    on<ResetPressed>(_onReset);
    on<ChangeTheme>(_onChangeTheme);
    on<ChangeLocale>(_onChangeLocale);
    on<LoadHistory>(_onLoadHistory);
    on<DeleteHistoryEntry>(_onDeleteHistoryEntry);
    on<ClearHistory>(_onClearHistory);
  }

  void _onCalculate(CalculatePressed event, Emitter<CalcState> emit) {
    if (event.percent <= 0 || event.value <= 0) {
      emit(state.copyWith(errorMessage: 'Values must be > 0'));
      return;
    }

    final result = event.value * 100 / event.percent;

    historyBox.add(HistoryEntry(
      value: event.value,
      percent: event.percent,
      result: result,
      date: DateTime.now(),
    ));

    emit(state.copyWith(
      value: event.value,
      percent: event.percent,
      result: result,
      errorMessage: null,
    ));
    add(LoadHistory());
  }

  void _onLoadHistory(LoadHistory event, Emitter<CalcState> emit) {
    final history = historyBox.toMap().entries.toList().reversed.toList();
    emit(state.copyWith(history: history));
  }

  void _onDeleteHistoryEntry(DeleteHistoryEntry event, Emitter<CalcState> emit) {
    historyBox.delete(event.key);
    add(LoadHistory());
  }

  void _onClearHistory(ClearHistory event, Emitter<CalcState> emit) {
    historyBox.clear();
    add(LoadHistory());
  }

  void _onReset(ResetPressed event, Emitter<CalcState> emit) {
    print('Reset pressed — resetting result to null');

    emit(CalcState(
      value: null,
      percent: null,
      result: null,
      errorMessage: null,
      history: state.history,
      locale: state.locale,
      themeMode: state.themeMode,
    ));
  }

  void _onChangeTheme(ChangeTheme event, Emitter<CalcState> emit) {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onChangeLocale(ChangeLocale event, Emitter<CalcState> emit) {
    emit(state.copyWith(locale: event.locale));
  }
}
