import 'package:auto_route/auto_route.dart';
import 'package:riverpods_simple/ui/info_detail_page.dart';
import 'package:riverpods_simple/ui/info_list.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
        path: "/",
        page: InfoList,
        initial: true
    ),
    AutoRoute(
        path: "detail",
        page: InfoDetailPage
    ),
  ],
)
class $AppRouter {}
