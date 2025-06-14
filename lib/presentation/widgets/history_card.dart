import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_calc/presentation/bloc/calc_bloc.dart';
import 'package:percent_calc/presentation/bloc/calc_event.dart';
import 'package:percent_calc/presentation/widgets/extensions.dart';

class HistoryCard extends StatelessWidget {
  final dynamic item;
  final bool isDark;

  const HistoryCard({required this.item, required this.isDark, super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDark ? Colors.white12 : Colors.white;
    final borderColor = isDark ? Colors.cyanAccent : Colors.blueAccent;
    final textColor = isDark ? Colors.white : Colors.black87;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(color: borderColor.withOpacity(0.2), blurRadius: 4, spreadRadius: 1, offset: const Offset(1, 2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${item.value.value} ÷ ${item.value.percent} × 100 = ${formatNumber(item.value.result)}",
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, size: 20),
              color: isDark ? Color(0xFFEDA2A2) : Colors.pinkAccent,
              onPressed: () => context.read<CalcBloc>().add(DeleteHistoryEntry(item.key)),
              tooltip: 'Удалить',
            ),
          ],
        ),
      ),
    );
  }
}
