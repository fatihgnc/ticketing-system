import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ticketing_system/models/server.dart';
import 'package:ticketing_system/providers/ticket_provider.dart';
import 'package:ticketing_system/providers/user_provider.dart';
import 'package:ticketing_system/screens/add_ticket_screen.dart';
import 'package:ticketing_system/screens/contact_screen.dart';
import 'package:ticketing_system/screens/forgot_password_screen.dart';
import 'package:ticketing_system/screens/login_screen.dart';
import 'package:ticketing_system/screens/main_screen.dart';
import 'package:ticketing_system/screens/register_screen.dart';
import 'package:ticketing_system/screens/settings_screen.dart';
import 'package:ticketing_system/screens/ticket_detail_screen.dart';
import 'package:ticketing_system/widgets/tickets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Server(),
        ),
        ChangeNotifierProvider(
          create: (_) => TicketProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: Consumer<UserProvider>(
        builder: (ctx, user, _) => MaterialApp(
          title: 'Ticket App',
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
          home: user.isAuth ? MainScreen() : LoginScreen(),
          routes: {
            MainScreen.routeName: (ctx) => MainScreen(),
            AddRequestScreen.routeName: (ctx) => AddRequestScreen(),
            SettingsScreen.routeName: (ctx) => SettingsScreen(),
            ContactScreen.routeName: (ctx) => ContactScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
            TicketDetailScreen.routeName: (ctx) => TicketDetailScreen(),
            ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
          },
        ),
      ),
    );
  }
}
