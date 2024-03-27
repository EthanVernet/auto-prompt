import 'package:flutter/material.dart';
import 'package:front/controller/controller_configure_project.dart';
import 'package:front/controller/setting_controller.dart';
import 'package:front/database.dart';
import 'package:front/view/pages/pages_configure_project/page_configure/page_configure.dart';
import 'package:sqflite/sqflite.dart';

import 'core/app_theme.dart';

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
  SettingController settingController = SettingController();
  late Database _database;
  late ControllerConfigureProject _configureProject

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  // Initialize database
  Future<void> _initializeDatabase() async {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    _database = await databaseHelper.database;
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: _initializeDatabase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return PageConfigure(db: _database);
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
