

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manage_peoples/routes/pages.dart';
import 'package:manage_peoples/routes/routes.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

final _listItem = [
    'assets/images/istockphoto.jpeg',
    'assets/images/images.jpeg',
  ];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    void renderlistItem() {
      _listItem.map((item) {
      var index =  _listItem.indexOf(item);
      return GestureDetector(
        onTap: () => index == 0? Get.toNamed(RouteNames.PEOPLE): Get.toNamed(RouteNames.BLOG),
        child:
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover
                ),
              ),
              child: Transform.translate(
                offset: Offset(50, -50),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Icon(Icons.bookmark_border, size: 15,)
                ),
              ),
            ),
          )
        );
      });
    }
    return Scaffold(
      backgroundColor: Colors.grey[600],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Icon(Icons.menu),
      //   title: Text("Home"),
      //   actions: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.all(10.0),
      //       child: Container(
      //         width: 36,
      //         height: 30,
      //         decoration: BoxDecoration(
      //           color: Colors.grey[800],
      //           borderRadius: BorderRadius.circular(10)
      //         ),
      //         child: Center(child: Text("0")),
      //       ),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   image: DecorationImage(
                //     image: Image.asset('assets/images/banner-home.png'),
                //     fit: BoxFit.cover
                //   )
                // ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Manage People", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Center(
                          child: Text("Show Now", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold))
                          ),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: 
                    _listItem.map((item) => 
                      GestureDetector(
                        onTap: () =>  _listItem.indexOf(item) == 0? Get.toNamed(RouteNames.PEOPLE): Get.toNamed(RouteNames.BLOG),
                        child:
                          Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover
                              ),
                            ),
                            child: Transform.translate(
                              offset: Offset(50, -50),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                                ),
                                child: Icon(Icons.bookmark_border, size: 15,)
                              ),
                            ),
                          ),
                      ))
                    ).toList(),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}