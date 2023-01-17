import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// extends BaseView<BaseController> 
class PeopleView extends StatefulWidget{
  // @override
  // Widget vBuilder(BuildContext context) {
  //   return Stack(
  //     children: [
  //       Scaffold(
  //         body: Column(
  //           children: [
  //             SafeArea(
  //               child: Row(
  //                 // crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 mainAxisSize: MainAxisSize.max,
  //                 children: [
  //                   IconButton(
  //                       onPressed: Get.back,
  //                       icon: const Icon(
  //                         Icons.arrow_back_ios,
  //                         color: Colors.white,
  //                         size: 18,
  //                       )),
  //                   Text(
  //                     "people".toUpperCase(),
  //                     // style: StyleUtils.styleEB20.copyWith(
  //                     //   color: Colors.white,
  //                     // ),
  //                   ),
  //                   const Spacer(),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }
  
  @override
  State<StatefulWidget> createState() => _PeopleViewState();
}

class _PeopleViewState extends State<PeopleView> { 
  List _loadedPhotos = [];
  String defaultImg = "assets/images/banner-home.png";

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);
    setState(() {
      _loadedPhotos = data;
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
          title: const Text('Kindacode.com'),
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
                      // leading: Image.network(
                      //   _loadedPhotos[index]["thumbnailUrl"],
                      //   width: 150,
                      //   fit: BoxFit.cover,
                      // ),
                      leading: Image.asset(defaultImg),
                      title: Text(_loadedPhotos[index]['title']),
                      subtitle:
                          Text('Photo ID: ${_loadedPhotos[index]["id"]}'),
                    );
                  },
                )
          )
      ); // body: Text(_loadedPhotos[0].toString())
    }
}