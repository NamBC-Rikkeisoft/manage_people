

import 'package:get/get.dart';
import 'package:manage_peoples/api/result.dart';
import 'package:manage_peoples/common/base_controller.dart';
import 'package:manage_peoples/models/blog.dart';

class BlogDetaiController extends BaseController {
  BlogDetaiController({
    this.blogModel
  });

  BlogModel? blogModel;

  @override
  void onInit() {
    super.onInit();
    blogModel = Get.arguments?["model"];
    // editSugar = sugar;
    // editSugar ??= SugarModel(
    //   id: DateTime.now().millisecondsSinceEpoch,
    //   tags: [],
    //   createdTime: DateTime.now().toIso8601String(),
    //   value: 75.0,
    //   state: SugarState.DEFAULT.name,
    //   savedDate: DateTime.now().toIso8601String(),
    // );
    // textInputController.text = editSugar!.value.toString();
    // _getListTracker();
    // update();
    // syncUpdateNote = AppController.syncDataEvent.stream.listen((event) {
    //   if (event.type == SyncDataType.UPDATE_SUGAR_TAGS) {
    //     _getListTracker();
    //   }
    // });
  }

  @override
  Future<Result> createData(String url, Map<String, String> params) {
    // TODO: implement createData
    throw UnimplementedError();
  }

  @override
  Future<List> getAllData(String url) {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

}