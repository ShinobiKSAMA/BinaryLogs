import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:binarylogs/comman/bloggetter.dart';

class Saved extends StatefulWidget {

  Saved({Key key, this.userP}) : super(key: key);
  final String userP;

  @override
  State<StatefulWidget> createState() {

    return SavedState();
  }
}

class SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(15.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Users').where('user', isEqualTo: widget.userP).snapshots(),
        builder: (context, snapshot) {
          return listBlogs(context, snapshot);
        },
      ),
    );
  }

}