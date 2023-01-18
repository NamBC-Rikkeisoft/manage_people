import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'detail/controller.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetIt.instance<BlogDetaiController>());
  }
}