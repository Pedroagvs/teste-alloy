import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teste_flutter/features/tables/views/tables.page.dart';
import 'package:teste_flutter/themes/theme.dart';

import 'injection_container.dart' as ic;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ic.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Teste flutter- Alloy',
      theme: lightTheme(),
      home: const Scaffold(
        body: TablesPage(),
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  /// Custom scroll behavior to allow scroll with touch and mouse
  const CustomScrollBehavior();
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
