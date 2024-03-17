import 'package:flutter/material.dart';
import 'package:flutter_fazaah/components/components.dart';
import 'package:flutter_fazaah/generated/l10n.dart';
import 'package:flutter_fazaah/screens/basic_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: getMaterialColor(Color.fromARGB(255, 30, 30, 36)),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 30, 30, 36),
              centerTitle: true)),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home:  BasicPage(),
    );
  }
}
