import 'package:flutter/material.dart';
import 'package:binarylogs/comman/get.dart';

class BinCard extends StatelessWidget {

  final String title;
  final String author;
  final String favCount;
  final String date;

  const BinCard({
    Key key,
    @required this.title,
    @required this.author,
    @required this.favCount,
    @required this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      height: 150.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Color(0xFF3E60C1),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              softWrap: true,
              maxLines: 2,
              style: ctitle,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey.shade500,
                  radius: 12.0,
                ),
                SizedBox(width: 8.0,),
                Text(
                  author,
                  style: cauthor,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              date,
              style: cauthor,
            ),
          ),
        ],
      ),
    );
  }
}