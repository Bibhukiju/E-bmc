import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 500);
  AnimationController _controller;
  int indexedPage = 0;

  AppBar appBar = AppBar();
  double borderRadius = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return WillPopScope(
      onWillPop: () async {
        if (!isCollapsed) {
          setState(() {
            _controller.reverse();
            borderRadius = 0.0;
            isCollapsed = !isCollapsed;
          });
          return false;
        } else
          return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            menu(context),
            AnimatedPositioned(
                left: isCollapsed ? 0 : 0.4 * screenWidth,
                right: isCollapsed ? 0 : -0.2 * screenWidth,
                top: isCollapsed ? 0 : screenHeight * 0.01,
                bottom: isCollapsed ? 0 : screenHeight * 0.1,
                duration: duration,
                curve: Curves.fastOutSlowIn,
                child: indexedPage == 0
                    ? dashboard(context)
                    : indexedPage == 1 ? userProfile(context) : post(context)),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: 0.6,
            heightFactor: 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexedPage = 0;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.whatshot),
                        Text(
                          'Feed',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexedPage = 1;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(MdiIcons.post),
                        Text(
                          'Post',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexedPage = 2;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(MdiIcons.faceProfile),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexedPage = 3;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.settings),
                        Text(
                          'Setting',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return SafeArea(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        type: MaterialType.card,
        animationDuration: duration,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Scaffold(
              appBar: AppBar(
                title: Text('NewsFeed'),
                leading: IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isCollapsed) {
                          _controller.forward();

                          borderRadius = 16.0;
                        } else {
                          _controller.reverse();

                          borderRadius = 0.0;
                        }

                        isCollapsed = !isCollapsed;
                      });
                    }),
              ),
              body: ListView.builder(itemBuilder: (context, ibdex) {
                return Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 4,
                  child: Card(
                    elevation: 10,
                    child: Text("Hello"),
                  ),
                );
              })),
        ),
      ),
    );
  }

  Widget userProfile(context) {
    return SafeArea(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        type: MaterialType.card,
        animationDuration: duration,
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Scaffold(
              appBar: AppBar(
                title: Text('Post'),
                backgroundColor: Color.fromRGBO(35, 88, 212, 1),
                centerTitle: true,
                leading: IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isCollapsed) {
                          _controller.forward();

                          borderRadius = 16.0;
                        } else {
                          _controller.reverse();

                          borderRadius = 0.0;
                        }

                        isCollapsed = !isCollapsed;
                      });
                    }),
              ),
              body: ListView.builder(itemBuilder: (context, ibdex) {
                return Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 4,
                  child: Card(
                    elevation: 10,
                    child: Text("Profile"),
                  ),
                );
              })),
        ),
      ),
    );
  }

  post(context) {
    return SafeArea(
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            type: MaterialType.card,
            animationDuration: duration,
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 8,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(" "),
                    elevation: 0,
                    backgroundColor: Color.fromRGBO(35, 88, 212, 1),
                    leading: IconButton(
                        icon: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: _controller,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isCollapsed) {
                              _controller.forward();

                              borderRadius = 16.0;
                            } else {
                              _controller.reverse();

                              borderRadius = 0.0;
                            }

                            isCollapsed = !isCollapsed;
                          });
                        }),
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 2.7,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(124, 124, 223, 1),
                                        Color.fromRGBO(35, 88, 212, 1)
                                      ],
                                      end: Alignment.topCenter,
                                      begin: Alignment.bottomCenter),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          MediaQuery.of(context).size.height /
                                              10),
                                      bottomRight: Radius.circular(
                                          MediaQuery.of(context).size.height /
                                              10))),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height / 6,
                              left: MediaQuery.of(context).size.width / 4,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/originals/74/ac/90/74ac9008e33db768d096d8bbd0b38028.jpg'),
                                radius: MediaQuery.of(context).size.width / 7,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Text(
                        "Post",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      Expanded(
                          child: Container(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Center(
                                                child: Text('${index + 1}'))),
                                      )))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      Expanded(
                          child: Container(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Center(
                                                child: Text('${index + 1}'))),
                                      )))),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      )
                    ],
                  ),
                ))));
  }
}
