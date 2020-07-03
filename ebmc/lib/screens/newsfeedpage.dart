import 'package:flutter/material.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          margin: EdgeInsets.only(top: 10, bottom: 5, left: 5),
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
      },
    );
  }
}
