import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';
import 'package:ticketing_system/screens/auth_screen.dart';
import 'package:ticketing_system/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TicketProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.workSans().fontFamily,
          primarySwatch: Colors.blue,
          primaryColor: Colors.grey.shade900,
          accentColor: Colors.white,
          textTheme: TextTheme(
            headline4: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2.5,
            ),
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
