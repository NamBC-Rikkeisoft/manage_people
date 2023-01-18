

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_peoples/models/blog.dart';
import 'package:manage_peoples/routes/routes.dart';

class ItemBlog extends StatelessWidget {
  const ItemBlog({
    super.key, 
    required this.blogModel, 
    this.onTap
  });

  final BlogModel blogModel;
  final Function()? onTap;

  void clickItemBlog() {
    Get.toNamed(
      RouteNames.blogDetail,
      // arguments: {
      //   "model": blogModel,
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    String defaultImg = "assets/images/banner-home.png";
    return ListTile(
      leading: Image.asset(defaultImg),
      onTap: () => { Get.toNamed(RouteNames.blogDetail, arguments: {"model": blogModel,}) },
      title: Text(blogModel.title!),
      subtitle:
          Text('Photo ID: ${blogModel.id}'),
    );    
  }

}