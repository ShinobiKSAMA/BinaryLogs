import 'package:binarylogs/pages/home.dart';
import 'package:binarylogs/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:binarylogs/pages/editor.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:binarylogs/pages/saved.dart';

class Nav extends StatefulWidget {

  Nav({Key key, this.authName}) : super(key: key);
  final String authName;

  @override
  State<StatefulWidget> createState() {
    return NavState();
  }
}

class NavState extends State<Nav> {

  int _currentIndex = 0;
  List<String> titles = [
    "Browse",
    "Saved",
    "Profile"
  ];

  @override
  Widget build(BuildContext context) {

    Color bColor = Theme.of(context).floatingActionButtonTheme.backgroundColor;
    Color fColor = Theme.of(context).floatingActionButtonTheme.foregroundColor;
    TextStyle navStyle = TextStyle(color: fColor);

    return Scaffold(

      //App Bar
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),

      //Body
      body: _currentIndex == 0
          ? Home()
          : _currentIndex == 1
          ? Saved(userP: widget.authName,)
          : Profile(self: true, pauth: widget.authName,),

      //Add Post
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Editor()),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      //Bottom Navigation
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.3,
        elevation: 8,
        backgroundColor: bColor,
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        hasInk: true,
        inkColor: fColor,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(backgroundColor: Color(0xFF5983FC), icon: Icon(Icons.library_books, color: fColor,), activeIcon: Icon(Icons.library_books, color: fColor,), title: Text("Browse", style: navStyle,)),
          BubbleBottomBarItem(backgroundColor: Color(0xFF5983FC), icon: Icon(Icons.bookmark, color: fColor,), activeIcon: Icon(Icons.bookmark, color: fColor,), title: Text("Saved", style: navStyle,)),
          BubbleBottomBarItem(backgroundColor: Color(0xFF5983FC), icon: Icon(Icons.account_circle, color: fColor,), activeIcon: Icon(Icons.account_circle, color: fColor,), title: Text("Profile", style: navStyle,)),
        ],
      ),

    );
  }

}