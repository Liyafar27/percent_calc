import 'package:hive/hive.dart';

part 'history_entry.g.dart';

@HiveType(typeId: 0)
class HistoryEntry extends HiveObject {
  @HiveField(0)
  final double value;

  @HiveField(1)
  final double percent;

  @HiveField(2)
  final double result;

  @HiveField(3)
  final DateTime date;

  HistoryEntry({
    required this.value,
    required this.percent,
    required this.result,
    required this.date,
  });
}
