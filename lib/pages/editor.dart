import 'package:flutter/material.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class Editor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditorState();
  }

}

class EditorState extends State<Editor> {

  ZefyrController _controller;

  @override
  void initState() {
    super.initState();
    _loadDocument().then((document) {
      setState(() {
        _controller = ZefyrController(document);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    Color bColor = Theme.of(context).floatingActionButtonTheme.backgroundColor;
    Color fColor = Theme.of(context).floatingActionButtonTheme.foregroundColor;

    return Scaffold(

      //App Bar
      appBar: AppBar(
        title: Text("BinaryLogs Editor"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.publish),
              onPressed: () {
                displayDialog(context, jsonEncode(_controller.document));
              },
            ),
          ),
        ],
      ),

      //Body
      body: ZefyrScaffold(
        child: ZefyrTheme(
          data: ZefyrThemeData(
            defaultLineTheme: LineTheme(
              textStyle: TextStyle(
                color: fColor,
              ),
              padding: EdgeInsets.all(0.0),
            ),
            toolbarTheme: ToolbarTheme.fallback(context).copyWith(
              color: bColor,
              iconColor: fColor,
              toggleColor: Color(0xFF3E60C1),
              disabledIconColor: Colors.grey,
            ),
          ),
          child: ZefyrEditor(
            controller: _controller,
            focusNode: FocusNode(),
            padding: EdgeInsets.all(15.0),
          ),
        ),
      ),

    );
  }

  Future<NotusDocument> _loadDocument() async {
    final file = File(Directory.systemTemp.path + "/example.jsom");
    if(await file.exists()) {
      final contents = await file.readAsString().then((data) => Future.delayed(Duration(seconds: 1), () => data));
      return NotusDocument.fromJson(jsonDecode(contents));
    }
    final Delta delta = Delta()..insert("Write Here\n");
    return NotusDocument.fromDelta(delta);
  }

  displayDialog(BuildContext context, data) async {

    final snapshot = Firestore.instance.collection('Blogs');
    TextEditingController _textFieldController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Enter Title:"),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                  hintText: "Title"
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  DateTime now = DateTime.now();
                  snapshot.add({
                    "title" : _textFieldController.text,
                    "author" : "Aditya Mhatre",
                    "descp" : data,
                    "time" : now.toString(),
                    "date" : now.year.toString()+"-"+now.month.toString()+"-"+now.day.toString(),
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Post'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        }
    );
  }

}
