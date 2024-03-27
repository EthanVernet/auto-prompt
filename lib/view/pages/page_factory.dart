<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:front/controller/controller_project.dart';
=======
import 'package:front/controller/controller_configure_project.dart';
>>>>>>> Stashed changes
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/pages_configure_project/page_configure/page_configure.dart';
import 'package:front/view/pages/pages_configure_project/page_copy/page_copy.dart';
import 'package:front/view/pages/pages_configure_project/page_select/page_select.dart';
import 'type_page.dart';


class PageFactory {
<<<<<<< Updated upstream
  static IPages getPage(TypePage type, ControllerProject? controller) {
    IPages tmp = PageConfigure(); // Assurez-vous que PageConfigure implémente IPages
=======
  static IPages getPage(TypePage type, ControllerConfigureProject? controller) {
    IPages tmp = PageConfigure(db: null,); // Assurez-vous que PageConfigure implémente IPages
>>>>>>> Stashed changes
    if (controller != null) {
      switch (type) {
        case TypePage.PAGE_CONFIGURE:
          tmp = PageConfigure(db: null,);
          break; // Ajoutez break pour terminer chaque cas
        case TypePage.PAGE_SELECT:
          tmp = PageSelect(controller: controller); // Assurez-vous que PageSelect implémente IPages
          break;
        case TypePage.PAGE_COPY:
          tmp = PageCopy(controller: controller);
      }
    }
    return tmp;
  }
}
