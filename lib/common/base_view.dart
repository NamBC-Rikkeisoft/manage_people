

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_peoples/common/base_controller.dart';

abstract class BaseView<T extends BaseController> extends StatelessWidget {
  const BaseView({super.key});

  final String tag = '';

  T get controller => GetInstance().find<T>(tag: tag);
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: controller,
      builder: (controller) {
        return RefreshIndicator(
          key: controller.refreshIndicatorKey,
          onRefresh: () async {
            await controller.onRefresh();
          },
          child: vBuilder(context),
        );
      },
    );
  }
  
  Widget vBuilder(BuildContext context);
}