import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:percent_calc/presentation/bloc/calc_bloc.dart';
import 'package:percent_calc/presentation/bloc/calc_event.dart';

class HeaderRow extends StatelessWidget {
  final AppLocalizations local;
  final bool isDark;

  const HeaderRow({required this.local, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          local.app_title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.cyanAccent : Colors.blueAccent,
            shadows: [Shadow(color: (isDark ? Colors.cyanAccent : Colors.blueAccent).withOpacity(0.5), blurRadius: 10)],
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.brightness_6, size: 20),
              onPressed: () {
                final isDark = Theme.of(context).brightness == Brightness.dark;
                context.read<CalcBloc>().add(ChangeTheme(isDark ? ThemeMode.light : ThemeMode.dark));
              },
            ),
            IconButton(
              icon: const Icon(Icons.language, size: 20),
              onPressed: () {
                final currentLocale = context.read<CalcBloc>().state.locale;
                final newLocale = currentLocale.languageCode == 'en' ? const Locale('ru') : const Locale('en');
                context.read<CalcBloc>().add(ChangeLocale(newLocale));
              },
            ),
          ],
        ),
      ],
    );
  }
}
