import 'package:ebmc/screens/userproflePage.dart';
import 'package:flutter/material.dart';
import './newsfeedpage.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Row(
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
                  icon: Icon(Icons.whatshot),
                  selectedIcon: Icon(Icons.whatshot),
                  label: Text('Feed'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.album),
                  selectedIcon: Icon(Icons.album),
                  label: Text('Post'),
                ),
                NavigationRailDestination(
                  icon: Align(child: Icon(Icons.account_circle)),
                  selectedIcon: Icon(Icons.account_circle),
                  label: Text('Profile'),
                ),
                NavigationRailDestination(
                  icon: Align(child: Icon(Icons.settings)),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
            VerticalDivider(
              thickness: 1,
              width: 1,
              endIndent: 10,
            ),
            // This is the main content.
            Expanded(
                child: Center(
                    child: _selectedIndex == 0
                        ? NewsFeedPage()
                        : _selectedIndex == 1
                            ? Container(
                                color: Colors.red,
                              )
                            : _selectedIndex == 2
                                ? UserProfile()
                                : Container()))
          ],
        ),
      ),
    );
  }
}
