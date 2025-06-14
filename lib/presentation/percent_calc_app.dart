import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:percent_calc/presentation/widgets/button_row.dart';
import 'package:percent_calc/presentation/widgets/calc_text_field.dart';
import 'package:percent_calc/presentation/widgets/extensions.dart';
import 'package:percent_calc/presentation/widgets/header_row.dart';
import 'package:percent_calc/presentation/widgets/history_card.dart';

import 'bloc/calc_bloc.dart';
import 'bloc/calc_event.dart';
import 'bloc/calc_state.dart';

class PercentCalcApp extends StatefulWidget {
  const PercentCalcApp({super.key});

  @override
  State<PercentCalcApp> createState() => _PercentCalcAppState();
}

class _PercentCalcAppState extends State<PercentCalcApp> {
  final _valueController = TextEditingController();
  final _percentController = TextEditingController();
  final _resultController = TextEditingController();

  String? _formula;

  final _formKey = GlobalKey<FormState>();
  bool _showHistory = false;

  void _onCalculatePressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final value = double.tryParse(_valueController.text.trim());
      final percent = double.tryParse(_percentController.text.trim());
      if (value != null && percent != null) {
        context.read<CalcBloc>().add(CalculatePressed(value, percent));
      }
      FocusScope.of(context).unfocus();
    }
  }

  void _onResetPressed(BuildContext context) {
    _valueController.clear();
    _percentController.clear();
    _resultController.clear();
    _formula = null;
    context.read<CalcBloc>().add(ResetPressed());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CalcBloc>().add(LoadHistory());
    });
  }

  @override
  void dispose() {
    _valueController.dispose();
    _percentController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient:
            isDark
                ? const LinearGradient(
                  colors: [Colors.black, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                : const LinearGradient(
                  colors: [Colors.white, Color(0xFFE0F7FA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocListener<CalcBloc, CalcState>(
          listener: (context, state) {
            if (state.result != null) {
              _resultController.text = formatNumber(state.result!);
              _formula =
              "${_valueController.text.trim()} ÷ ${_percentController.text.trim()} × 100 = ${formatNumber(state.result!)}";
            } else {
              _resultController.clear();
            }
          },

          child: BlocBuilder<CalcBloc, CalcState>(
            builder: (context, state) {
              final history = state.history;
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        HeaderRow(local: local, isDark: isDark),
                        const SizedBox(height: 32),
                        CalcTextField(controller: _valueController, label: local.value_label, isDark: isDark),
                        const SizedBox(height: 16),
                        CalcTextField(controller: _percentController, label: local.percent_label, isDark: isDark),
                        const SizedBox(height: 24),
                        CalcTextField(
                          controller: _resultController,
                          label: local.result_label(""),
                          isDark: isDark,
                          readOnly: true,
                        ),
                        const SizedBox(height: 8),

                        if (_formula != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              _formula!,
                              style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.black87,
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        const SizedBox(height: 24),
                        ButtonRow(
                          isDark: isDark,
                          onCalculate: () => _onCalculatePressed(context),
                          onReset: () => _onResetPressed(context),
                          local: local,
                        ),
                        const SizedBox(height: 32),
                        if (history.isNotEmpty) ...[
                          GestureDetector(
                            onTap: () => setState(() => _showHistory = !_showHistory),
                            child: Text(
                              _showHistory ? local.hide_history : local.show_history,
                              style: TextStyle(
                                color: isDark ? Colors.cyanAccent : Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          AnimatedCrossFade(
                            duration: const Duration(milliseconds: 300),
                            crossFadeState: _showHistory ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            firstChild: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: history.length,
                                  itemBuilder: (context, index) {
                                    final item = history[index];
                                    return Column(
                                      children: [
                                        SizedBox(height: 12),
                                        HistoryCard(item: item, isDark: isDark),
                                        if (index < history.length - 1) const SizedBox(height: 12),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                            secondChild: const SizedBox.shrink(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

