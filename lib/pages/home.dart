import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:binarylogs/comman/bloggetter.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(15.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Blogs').orderBy('time', descending: true).snapshots(),
        builder: (context, snapshot) {
          return listBlogs(context, snapshot);
        },
      ),
    );
  }

}