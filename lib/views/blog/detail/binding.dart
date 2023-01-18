import 'package:get_it/get_it.dart';
import 'package:get/get.dart';
import 'package:manage_peoples/views/blog/detail/controller.dart';

class BlogDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetIt.instance<BlogDetaiController>());
  }
}