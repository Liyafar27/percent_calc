import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:percent_calc/models/history_entry.dart';
import 'package:percent_calc/presentation/bloc/calc_bloc.dart';
import 'package:percent_calc/presentation/bloc/calc_event.dart';
import 'package:percent_calc/presentation/bloc/calc_state.dart';

class MockHistoryBox extends Mock implements Box<HistoryEntry> {}

class FakeHistoryEntry extends Fake implements HistoryEntry {}

void main() {
  group('CalcBloc', () {

    late MockHistoryBox mockBox;

    setUp(() {
      registerFallbackValue(FakeHistoryEntry());

      mockBox = MockHistoryBox();
      when(() => mockBox.add(any())).thenAnswer((_) async => 0);
    });

    group('CalcBloc', () {
      blocTest<CalcBloc, CalcState>(
        'emits [CalcState with result] when CalculatePressed is added with valid input',
        build: () => CalcBloc(mockBox),
        act: (bloc) => bloc.add(CalculatePressed(10, 25)),
        expect: () => [isA<CalcState>().having((s) => s.result, 'result', closeTo(40.0, 0.01))],
      );

      blocTest<CalcBloc, CalcState>(
        'emits [CalcState with null result and error] when CalculatePressed is added with invalid input',
        build: () => CalcBloc(mockBox),
        act: (bloc) => bloc.add(CalculatePressed(0, 25)),
        expect:
            () => [
              isA<CalcState>()
                  .having((s) => s.result, 'result', isNull)
                  .having((s) => s.errorMessage, 'error', isNotNull),
            ],
      );

      blocTest<CalcBloc, CalcState>(
        'resets state on ResetPressed',
        build: () => CalcBloc(mockBox),
        act:
            (bloc) =>
                bloc
                  ..add(CalculatePressed(10, 25))
                  ..add(ResetPressed()),
        expect:
            () => [
              isA<CalcState>().having((s) => s.result, 'result', closeTo(40.0, 0.01)),
              isA<CalcState>().having((s) => s.result, 'result', isNull),
            ],
      );
    });
  });
}
