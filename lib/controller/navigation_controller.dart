import 'package:flutter/material.dart';
import 'package:front/controller/controller_project.dart';
import 'package:front/logic/business/input_validator.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/page_factory.dart';
import 'package:front/view/pages/type_page.dart';

class NavigationController {
  static final NavigationController _instance = NavigationController._internal();

  factory NavigationController() => _instance;

  NavigationController._internal();

  void navigateTo(BuildContext context, TypePage type, MainController? controller) {
    bool shouldNavigate = true;
    IPages page;

    InputValidator? validator = controller != null ? InputValidator(controller) : null;

    if (controller != null) {
      switch (type) {
        case TypePage.PAGE_SELECT:
          if (validator?.validateForPageSelect() == true) {
            page = PageFactory.getPage(type, controller);
          } else {
            shouldNavigate = false;
            _showErrorDialog(context, "Vous n'avez pas saisi toutes les informations");
            page = PageFactory.getPage(TypePage.PAGE_CONFIGURE, controller);
          }
          break;
        case TypePage.PAGE_COPY:
          if (validator?.validateForPageCopy() == true) {
            page = PageFactory.getPage(type, controller);
          } else {
            shouldNavigate = false;
            _showErrorDialog(context, "Aucun fichier n'a été sélectionné");
            page = PageFactory.getPage(TypePage.PAGE_SELECT, controller);
          }
          break;
        default:
          page = PageFactory.getPage(type, controller);
          break;
      }
    } else {
      page = PageFactory.getPage(type, controller);
    }

    if (shouldNavigate) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page as Widget));
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Erreur",
            style: TextStyle(color: Colors.black),
          ),
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

extension on TypePage {
  bool requiresController() {
    return this == TypePage.PAGE_SELECT || this == TypePage.PAGE_CONFIGURE || this == TypePage.PAGE_COPY;
  }
}
