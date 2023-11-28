import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:access_control_residential/myapp.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}



