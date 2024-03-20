// TEST RESTRICTED
import 'package:flutter/material.dart';
import 'package:front/view/pages/page_configure/page_configure.dart';

import 'app/app_theme.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  ValueNotifier<String> appBarTitleNotifier = ValueNotifier<String>('Configure');

  @override
  Widget build(BuildContext context) {
    return PageConfigure();
  }
}
