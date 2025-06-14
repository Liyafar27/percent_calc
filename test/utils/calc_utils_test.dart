import 'package:flutter_test/flutter_test.dart';
import 'package:percent_calc/utils/calc_utils.dart';

void main() {
  group('calculatePercent', () {
    test('correctly calculates 25% of 10 to 100%', () {
      final result = calculatePercent(10, 25);
      expect(result, closeTo(40.0, 0.001));
    });

    test('throws error if value is zero or negative', () {
      expect(() => calculatePercent(0, 25), throwsArgumentError);
      expect(() => calculatePercent(-10, 25), throwsArgumentError);
    });

    test('throws error if percent is zero or negative', () {
      expect(() => calculatePercent(10, 0), throwsArgumentError);
      expect(() => calculatePercent(10, -25), throwsArgumentError);
    });

    test('correctly handles decimal values', () {
      final result = calculatePercent(5.5, 11);
      expect(result, closeTo(50.0, 0.001));
    });
  });
}
