import 'package:flutter/material.dart';

import 'package:front/database/dao_file.dart';
import 'package:front/database/dao_folder.dart';
import 'package:front/database/dao_section.dart';

class MainController extends ChangeNotifier {
  late DaoFile daoFile;
  late DaoFolder daoFolder;
  late DaoSection daoSection;

  MainController(){
    daoFile = DaoFile();
    daoFolder = DaoFolder();
    daoSection = DaoSection();
  }
}
