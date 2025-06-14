import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonRow extends StatelessWidget {
  final VoidCallback onCalculate;
  final VoidCallback onReset;
  final bool isDark;
  final AppLocalizations local;

  const ButtonRow({required this.onCalculate, required this.onReset, required this.isDark, required this.local});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onCalculate,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? Colors.cyanAccent : Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              local.calculate,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: onReset,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: isDark ? Colors.cyanAccent : Colors.blueAccent),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(
              local.reset,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? Colors.cyanAccent : Colors.blueAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
