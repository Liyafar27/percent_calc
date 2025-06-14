import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_calc/core/theme/app_theme.dart';
import 'package:percent_calc/presentation/bloc/calc_bloc.dart';
import 'package:percent_calc/presentation/bloc/calc_state.dart';
import 'package:percent_calc/presentation/percent_calc_app.dart';

import 'models/history_entry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(HistoryEntryAdapter());

  final historyBox = await Hive.openBox<HistoryEntry>('historyBox');

  runApp( MainApp(historyBox:historyBox));
}

class MainApp extends StatelessWidget {
  final Box<HistoryEntry> historyBox;

  const MainApp({super.key, required this.historyBox});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalcBloc(historyBox),
      child: BlocBuilder<CalcBloc, CalcState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Percent Calc',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: state.themeMode,
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ru')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const PercentCalcApp(),
          );
        },
      ),
    );
  }
}
