import 'package:access_control_residential/screens/addvisitor.dart';
import 'package:access_control_residential/screens/homeadmin.dart';
import 'package:access_control_residential/screens/homeguard.dart';
import 'package:access_control_residential/screens/login.dart';
import 'package:access_control_residential/screens/settings.dart';
import 'package:access_control_residential/screens/signup.dart';
import 'package:access_control_residential/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:access_control_residential/screens/addresident.dart';
import 'package:access_control_residential/screens/addvehicle.dart';
import 'package:access_control_residential/constants.dart';
import 'package:access_control_residential/models/Register.dart';

final apiDataProvider = FutureProvider.autoDispose<List<Register>>((ref) async {
  try {
    final response = await http.get(Uri.parse('https://park-planner-ayiye7cx5q-tl.a.run.app/registers/'));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final decodedData = jsonDecode(body);
      print (decodedData);
      List<Register> registerList = (decodedData as List)
          .map((data) => Register(
                data['id'],
                data['date'],
                data['time'],
                data['iduser'],
                data['idvehicle'],
                data['Estado']
              ))
          .toList();
      print (decodedData);
      return registerList;
    } else {
      throw Exception('Failed to load data from API');
    }
  } catch (error) {
    throw Exception('Error during API call: $error');
  }
});

final themeProvider = Provider<ThemeData>((ref) {
  // Define your theme here
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
    useMaterial3: true,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
});

final initialRouteProvider = Provider<String>((ref) {
  // Define your initial route here
  return 'SplashPage';
});

final routesProvider = Provider<Map<String, Widget Function(BuildContext)>>((ref) {
  return {
    'SplashPage': (context) => const SplashPage(),
    'LogInPage': (context) => const LogInPage(),
    'SignUpPage': (context) => const SignUpPage(),
    'HomeAdminPage': (context) => const HomeAdminPage(),
    'SettingsPage': (context) => const SettingsPage(),
    'ResidentPage': (context) => const ResidentPage(),
    'VisitorPage': (context) => const VisitorPage(),
    'VehiclePage': (context) => const VehiclePage(),
    'HomeGuardPage': (context) => const HomeGuardPage(),
  };
});
