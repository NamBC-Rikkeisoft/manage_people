import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:manage_peoples/api/result.dart';

abstract class BaseController<T> extends GetxController {
    bool isLoadMore = false;

    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

    Future<void> onRefresh() async {}

    Future<List<T>> getAllData(String url);
    Future<Result> createData(String url, Map<String,String> params);

    @override
    void onInit() {
      super.onInit();
    }
}