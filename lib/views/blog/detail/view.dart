

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manage_peoples/common/base_view.dart';
import 'package:manage_peoples/views/blog/controller.dart';
import 'package:manage_peoples/views/blog/detail/controller.dart';

class DetailView extends BaseView<BlogDetaiController> {
  const DetailView({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Text("Detail"),
    );
  }
}