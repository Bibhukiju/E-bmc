import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.selected,
              elevation: 5.0,
              groupAlignment: -1.0,
              destinations: [
                NavigationRailDestination(
                  icon: Text("Feed"),
                  selectedIcon: Icon(Icons.whatshot),
                  label: Text('Feed'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.album),
                  selectedIcon: Icon(Icons.album),
                  label: Text('Post'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_circle),
                  selectedIcon: Icon(Icons.account_circle),
                  label: Text('Profile'),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: Center(
                  child: _selectedIndex == 0
                      ? ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return PostList();
                          },
                        )
                      : _selectedIndex == 1
                          ? Container(
                              color: Colors.red,
                            )
                          : Container(
                              color: Colors.amber,
                            )),
            )
          ],
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 5),
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.blue[200],
                radius: MediaQuery.of(context).size.height / 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text("@username")
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
                  child: Text(
                      'your post is will be here ..........................'))),
        ],
      ),
    );
  }
}
