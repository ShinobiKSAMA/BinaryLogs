import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binarylogs/comman/get.dart';
import 'package:zefyr/zefyr.dart';

const String testDevice = '';

class Log extends StatefulWidget {
  Log({
    Key key,
    this.title,
    this.data,
    this.author,
    this.timeD
  }) : super(key: key);

  final String title;
  final String data;
  final String author;
  final String timeD;

  @override
  State<StatefulWidget> createState() {
    return LogState();
  }
}

class LogState extends State<Log> {

  String title;
  String data;
  String author;
  String timeD;

  @override
  void initState() {
    title = widget.title;
    data = widget.data;
    author = widget.author;
    timeD = widget.timeD;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Color fColor = Theme.of(context).floatingActionButtonTheme.foregroundColor;

    return Scaffold(

      //App Bar
      appBar: AppBar(
        title: Text("BinaryLogs"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),

      //Body
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  softWrap: true,
                  maxLines: 5,
                  style: ltitle,
                ),
                Divider(
                  thickness: 2.0,
                  height: 20.0,
                ),
                ZefyrTheme(
                  data: ZefyrThemeData(
                    defaultLineTheme: LineTheme(
                      textStyle: TextStyle(
                        color: fColor,
                      ),
                      padding: EdgeInsets.all(0.0),
                    ),

                  ),
                  child: ZefyrView(
                    document: NotusDocument.fromJson(jsonDecode(data)),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      timeD,
                      style: lauthor,
                    ),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade500,
                          radius: 12.0,
                        ),
                        SizedBox(width: 8.0,),
                        Text(
                          author,
                          style: lauthor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height:60.0),
              ],
            ),
          ),
        ],
      ),

    );
  }

}
