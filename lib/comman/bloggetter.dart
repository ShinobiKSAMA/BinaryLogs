import 'package:flutter/material.dart';
import 'package:binarylogs/widgets/card.dart';
import 'package:binarylogs/pages/log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

listBlogs (context, snapshot) {
  if(!snapshot.hasData) return Center(child:CircularProgressIndicator());
  else if (snapshot.data.documents.length == 0) return Text("No Posts Yet");
  else {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.0);
      },
      itemBuilder: (BuildContext context, int index) {
        DocumentSnapshot blogs = snapshot.data.documents[index];
        return InkWell(
          child: BinCard(
            title: blogs['title'],
            author: blogs['author'],
            favCount: blogs['likes'],
            date: blogs['date'],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Log(
                title: blogs['title'],
                author: blogs['author'],
                data: blogs['descp'],
                timeD: blogs['date'],
              )),
            );
          },
        );
      },
      itemCount: snapshot.data.documents.length,
    );
  }
}