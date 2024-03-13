import 'package:flutter/material.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/page_configure/page_configure.dart';
import 'package:front/view/pages/page_copy/page_copy.dart';
import 'package:front/view/pages/page_select/page_select.dart';
import 'type_page.dart';


class PageFactory {
  static IPages getPage(TypePage type, MainController? controller) {
    IPages tmp = PageConfigure(); // Assurez-vous que PageConfigure implémente IPages
    if (controller != null) {
      switch (type) {
        case TypePage.PAGE_CONFIGURE:
          tmp = PageConfigure();
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
