import 'package:app_zero/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,
      textTheme: GoogleFonts.robotoTextTheme(), //aqui é para definir a fonte para todo o app
      ),
      home: const LoginPage(),
      // home: const HomePage(),
    );

  }
}
