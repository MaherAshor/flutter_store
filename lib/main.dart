import 'package:flutter/material.dart';
import 'package:flutter_fazaah/generated/l10n.dart';
import 'package:flutter_fazaah/page_view/first_page.dart';
import 'package:flutter_fazaah/screens/login_screen.dart';
import 'package:flutter_fazaah/screens/regaster_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.amber, centerTitle: true)),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const LoginScreen(),
    );
  }
}
