import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalcTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isDark;
  final bool readOnly;
  final FocusNode? focusNode;

  const CalcTextField({
    required this.controller,
    required this.label,
    required this.isDark,
    this.readOnly = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      readOnly: readOnly,
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDark ? Colors.cyanAccent : Colors.blueAccent),
        filled: true,
        fillColor: isDark ? Colors.white12 : Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: isDark ? Colors.cyanAccent : Colors.blueAccent),
        ),
        errorStyle: TextStyle(color: isDark ? Color(0xFFEDA2A2) : Colors.pinkAccent),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: isDark ? Color(0xFFEDA2A2) : Colors.pinkAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: isDark ? Color(0xFFEDA2A2) : Colors.pinkAccent),
        ),
      ),
      validator:
          readOnly
              ? null
              : (val) {
                final num = double.tryParse(val ?? '');
                if (val == null || val.isEmpty) return AppLocalizations.of(context)!.required_field;
                if (num == null || num <= 0) return AppLocalizations.of(context)!.must_be_positive;
                return null;
              },
    );
  }
}
