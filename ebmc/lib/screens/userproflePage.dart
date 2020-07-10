import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2.7,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
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
                              MediaQuery.of(context).size.height / 10),
                          bottomRight: Radius.circular(
                              MediaQuery.of(context).size.height / 10))),
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
                      itemBuilder: (BuildContext context, int index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Center(child: Text('${index + 1}'))),
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
                      itemBuilder: (BuildContext context, int index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                height: MediaQuery.of(context).size.width / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Center(child: Text('${index + 1}'))),
                          )))),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          )
        ],
      ),
    );
  }
}
