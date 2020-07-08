import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  final Widget child;
  FeedPage({key, this.child}) : super(key: key);

  static _FeedPageState of(BuildContext context) =>
      context.findAncestorStateOfType<_FeedPageState>();

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _FeedPageState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxSlide = 255;
    return Scaffold(
      body: GestureDetector(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, _) {
            double animationVal = _controller.value;
            double translateVal = animationVal * maxSlide;
            double scaleVal = 1 - (animationVal * 0.3);
            return Stack(
              children: <Widget>[
                CustomDrawer(),
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..translate(translateVal)
                    ..scale(scaleVal),
                  child: GestureDetector(
                      onTap: () {
                        if (_controller.isCompleted) {
                          close();
                        }
                      },
                      child: widget.child),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.purple,
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text('Flutter App',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
