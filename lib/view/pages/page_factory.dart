import 'package:front/controller/controller_configure_project.dart';
import 'package:front/view/pages/i_pages.dart';
import 'package:front/view/pages/pages_configure_project/page_configure/page_configure.dart';
import 'package:front/view/pages/pages_configure_project/page_copy/page_copy.dart';
import 'package:front/view/pages/pages_configure_project/page_select/page_select.dart';
import 'type_page.dart';


class PageFactory {
  static IPages getPage(TypePage type, ControllerConfigureProject controller) {
    IPages tmp = PageConfigure(controller: controller,);
      switch (type) {
        case TypePage.PAGE_CONFIGURE:
          tmp = PageConfigure(controller: controller,);
          break;
        case TypePage.PAGE_SELECT:
          tmp = PageSelect(controller: controller);
          break;
        case TypePage.PAGE_COPY:
          tmp = PageCopy(controller: controller);
      }
    return tmp;
  }
}
