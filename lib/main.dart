// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'package:vibration_timer/title/title_ful_screen.dart';
import 'package:vibration_timer/language/japanese_cupertino_localizations.dart'
    as jcl; //(ほかのライブラリと競合したのでas jclとしている)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   DefaultCupertinoLocalizations.delegate,
      //   jcl.JapaneseCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('en', 'US'),
      //   Locale('ja', 'JP'),
      // ],
      // locale: Locale('ja', 'JP'),
      debugShowCheckedModeBanner: false,
      home: TitleFulScreen(),
    );
  }
}
