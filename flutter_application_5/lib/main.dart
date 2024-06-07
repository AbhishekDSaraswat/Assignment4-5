// // lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/doctor.dart';
import 'providers/Authentication.dart';
import 'display/first_loginscreen.dart';
import 'display/login/loginscreen.dart';
import 'display/registration_screen.dart';
import 'display/doctor_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositries/doctor_repository.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        RepositoryProvider(create: (context) => DoctorRepository()),
      ],
      child: MaterialApp(
        title: 'SAPDOS',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const InitialLoginScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => RegistrationScreen(),
          '/doctor': (context) => DoctorScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
