import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:manage_peoples/models/blog.dart';
import 'package:manage_peoples/ultis/constants.dart';
import 'package:manage_peoples/views/blog/controller.dart';
import 'package:manage_peoples/views/blog/widgets/item_blog.dart';

class BlogView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlogViewState();

}

class _BlogViewState extends State<BlogView> {
  List<BlogModel> _loadedPhotos = [];
  BlogController blogController = BlogController();

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    List<BlogModel> blogsValues = await blogController.getAllData(Utils.urlBlog);
    setState(() {
      _loadedPhotos = blogsValues;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Blogs'),
        ),
        body: SafeArea(
          child: _loadedPhotos.isEmpty
              ? Center(
                  child: ElevatedButton(
                    onPressed: _fetchData,
                    child: const Text('Load Photos'),
                  ),
                )
              // The ListView that displays photos
              : ListView.builder(
                  itemCount: _loadedPhotos.length,
                  // itemBuilder: (ctx, index) {
                  //   return ListTile(
                  //     leading: Image.asset(defaultImg),
                  //     title: Text(_loadedPhotos[index].title!),
                  //     subtitle:
                  //         Text('Photo ID: ${_loadedPhotos[index].id}'),
                  //         onTap: blogController.clickItemBlog(index),
                  //   );
                  // },
                  itemBuilder: (BuildContext ctx, index) => ItemBlog(
                    blogModel: _loadedPhotos[index],
                    // onTap: blogController.clickItemBlog(0),
                  ),
                )

                // itemBuilder: (ctx, index) => ItemSugar(
                //                 model: controller.sugars[index],
                //                 onTap: () => controller.clickItemSugar(index),
                //               ),
          )
      ); // bod
  }

}