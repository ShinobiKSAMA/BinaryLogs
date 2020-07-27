import 'package:flutter/material.dart';
import 'package:binarylogs/comman/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:binarylogs/comman/bloggetter.dart';

class Profile extends StatefulWidget {

  Profile({Key key, this.self, this.pauth}) : super(key: key);
  final bool self;
  final String pauth;

  @override
  State<StatefulWidget> createState() {

    return ProfileState();
  }
}

class ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {

    final r = MediaQuery.of(context).size.width/4;

    return SingleChildScrollView(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: r,
            backgroundColor: Colors.grey,
          ),
          SizedBox(height: 15.0,),
          Text(
            widget.pauth,
            style: pname,
          ),
          SizedBox(height: 10.0,),
          Text(
            "Million Miles Away There is A Star",
            maxLines: 3,
            style: pbio,
          ),
          SizedBox(height: 10.0,),
          widget.self ? Text("100 Followers")
              : RaisedButton(
            onPressed: () {},
            elevation: 0,
            color: Colors.blueAccent,
            textColor: Colors.white,
            child: Text("Follow"),
          ),
          Divider(thickness: 2.0, height: 25.0,),
          Text(
            "Recent Posts",
            style: pbio,
          ),
          SizedBox(height: 10.0,),
          Container(
            height: MediaQuery.of(context).size.height-30-r*2-60-60-132,
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Blogs')
                  .where('author', isEqualTo: widget.pauth).snapshots(),
              builder: (context, snapshot) {
                return listBlogs(context, snapshot);
              },
            ),
          ),
        ],
      ),
    );
  }

}