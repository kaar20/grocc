import 'package:get/get.dart';
import 'package:grocc/app/modules/auth/views/phone.dart';
import 'package:grocc/app/modules/auth/views/verify.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.verify,
      page: () => const Verify(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.Phone,
      page: () => const Phone(),
      binding: AuthBinding(),
    ),
  ];
}
