import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:manage_peoples/models/blog.dart';
import 'package:manage_peoples/ultis/constants.dart';
import 'package:manage_peoples/views/blog/controller.dart';

class BlogView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlogViewState();

}

class _BlogViewState extends State<BlogView> {
  List<BlogModel> _loadedPhotos = [];
  String defaultImg = "assets/images/banner-home.png";
  late BlogController blogController;

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    blogController = BlogController();
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
                  itemBuilder: (BuildContext ctx, index) {
                    return ListTile(
                      leading: Image.asset(defaultImg),
                      title: Text(_loadedPhotos[index].title!),
                      subtitle:
                          Text('Photo ID: ${_loadedPhotos[index].id}'),
                    );
                  },
                )
          )
      ); // bod
  }

}