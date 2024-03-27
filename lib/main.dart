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
      darkTheme: AppTheme.darkTheme, // Correction : Utilisez `darkTheme` si vous souhaitez un thème sombre différent.
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
  late ControllerConfigureProject configureProject;

  @override
  void initState() {
    super.initState();
    _initializeDatabase().then((_) {
      configureProject = ControllerConfigureProject(_database);
    });
  }

  // Initialize database
  Future<void> _initializeDatabase() async {
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    _database = await databaseHelper.database;
  }

  @override
  Widget build(BuildContext context) {
    // Le FutureBuilder n'est pas nécessaire ici car vous initialisez déjà la base de données dans initState
    // et mettez à jour l'état une fois terminé.
    return ValueListenableBuilder(
      valueListenable: appBarTitleNotifier, // Écoutez appBarTitleNotifier pour reconstruire l'interface utilisateur lorsque le titre change
      builder: (context, value, child) {
        return PageConfigure(controller: configureProject); // Assurez-vous que PageConfigure accepte un paramètre `controller`
      },
    );
  }
}
