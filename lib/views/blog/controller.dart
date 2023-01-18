

// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:manage_peoples/api/api.dart';
import 'package:manage_peoples/api/result.dart';
import 'package:manage_peoples/common/base_controller.dart';
import 'package:manage_peoples/models/blog.dart';
import 'package:manage_peoples/routes/routes.dart';
import 'package:manage_peoples/ultis/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BlogController extends BaseController<BlogModel>{
  late ApiServiceBase apiServiceBase;
  List<BlogModel> blogs = [];

  @override
  Future<Result> createData(String url, Map<String, String> params) {
    // TODO: implement createData
    throw UnimplementedError();
  }

  @override
  Future<List<BlogModel>> getAllData(String url) async {
      apiServiceBase = ApiServiceBase();
      String url = Utils.urlBlog;
      // try {
      //     http.Response blogsValues = await apiServiceBase.getDataFromUrlWithResponse(urlApi: url);
      //     if (blogsValues.statusCode == 200 || blogsValues.statusCode == 201) {
      //       var jsonData = json.decode(blogsValues.body);
      //       blogs = jsonData?.map<BlogModel>((e) => BlogModel.fromJson(e)).toList() ?? [];
      //       // for (var element in jsonData) {
      //       //     blogs.add(new BlogModel.fromJson(element));
      //       // }
      //     } else if(blogsValues.statusCode == 401){
      //       // Log error authentication
      //     } else {
      //       // Log error server
      //     }
      // } catch (e) {
      //     // Log error
      // }

      try {
          Response blogsValues = await apiServiceBase.getDataFromUrlWithResponse(urlApi: url);
          if (blogsValues.statusCode == 200 || blogsValues.statusCode == 201) {
            var jsonData = json.decode(blogsValues.bodyString!);
            blogs = jsonData?.map<BlogModel>((e) => BlogModel.fromJson(e)).toList() ?? [];
          } else if(blogsValues.statusCode == 401){
            // Log error authentication
          } else {
            // Log error server
          }
      } catch (e) {
          // Log error
      }
      
      return blogs;
  }

  clickItemBlog(int index) {
    Get.toNamed(
      RouteNames.blogDetail,
      arguments: {
        "model": blogs[index],
      },
    );
  }

}