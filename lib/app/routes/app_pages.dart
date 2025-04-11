import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/user_add/bindings/user_add_binding.dart';
import '../modules/user_add/views/user_add_view.dart';
import '../modules/user_detail/bindings/user_detail_binding.dart';
import '../modules/user_detail/views/user_detail_view.dart';
import '../modules/user_list/bindings/user_list_binding.dart';
import '../modules/user_list/views/user_list_view.dart';
import '../modules/user_update/bindings/user_update_binding.dart';
import '../modules/user_update/views/user_update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER_LIST,
      page: () => const UserListView(),
      binding: UserListBinding(),
    ),
    // GetPage(
    //   name: _Paths.USER_DETAIL,
    //   page: () =>  UserDetailView(),
    //   binding: UserDetailBinding(),
    // ),

    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.USER_UPDATE,
      page: () => UserUpdateView(),
      binding: UserUpdateBinding(),
    ),
    GetPage(
      name: _Paths.USER_ADD,
      page: () => UserAddView(),
      binding: UserAddBinding(),
    ),
  ];
}
