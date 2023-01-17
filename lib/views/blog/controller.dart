

// ignore_for_file: unrelated_type_equality_checks

import 'package:manage_peoples/api/api.dart';
import 'package:manage_peoples/api/result.dart';
import 'package:manage_peoples/common/base_controller.dart';
import 'package:manage_peoples/models/blog.dart';
import 'package:manage_peoples/ultis/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BlogController extends BaseController<BlogModel>{
  late ApiServiceBase apiServiceBase;

  @override
  Future<Result> createData(String url, Map<String, String> params) {
    // TODO: implement createData
    throw UnimplementedError();
  }

  @override
  Future<List<BlogModel>> getAllData(String url) async {
    List<BlogModel> blogs = [];
      apiServiceBase = ApiServiceBase();
      String url = Utils.urlBlog;
      // try {
      //   apiServiceBase.getDataFromUrlWithResponse(urlApi: url).then((result) {
      //     if(result.statusCode == 200 || result.statusCode == 201 || result.body != null) {
      //       // String data ='{id:1, thumbnailUrl: "lorem ipsum", title: "dolor set amet"}';
      //       var jsonData = json.decode(result.body);

      //       for (var element in jsonData) {
      //          blogs.add(new BlogModel.fromJson(element));
      //       } 
      //       return blogs;
      //       // jsonData?.map<BlogModel>((e) => BlogModel.fromJson(e)).toList() ?? [];
      //       // var jsonData = json.decode(jsonEncode(result.body!));
      //       // blogs = jsonData?.map<BlogModel>((e) => BlogModel.fromJson(e)).toList() ?? [];
      //       // String body = result.body!;
      //       // List? dynamicBlogs = result.body;
      //       // blogs = dynamicBlogs!.cast();
      //     }
      //   });
      // } catch(e) {
      //   // Log error
      // }
      try {
          http.Response blogsValues = await apiServiceBase.getDataFromUrlWithResponse(urlApi: url);
          if (blogsValues.statusCode == 200 || blogsValues.statusCode == 201) {
            var jsonData = json.decode(blogsValues.body);
            for (var element in jsonData) {
                blogs.add(new BlogModel.fromJson(element));
            }
          }
      } catch (e) {
          // Log error
      }
      
      return blogs;
  }

}