import 'package:flutter/material.dart';
import 'package:access_control_residential/Provider/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final initialRoute = ref.watch(initialRouteProvider);
    final routes = ref.watch(routesProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}