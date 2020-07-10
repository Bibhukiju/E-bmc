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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          margin: EdgeInsets.only(top: 10, bottom: 5, left: 5),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.blue[200],
                    backgroundImage: NetworkImage(
                        "https://66.media.tumblr.com/4df6587bcdff3458d82f89765b3a96b1/tumblr_psstbxkhWK1xjy6ibo4_250.png"),
                    radius: MediaQuery.of(context).size.height / 25,
                  ),
                  Text(
                    "@username",
                    style: TextStyle(color: Colors.lightBlue),
                  )
                ],
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  print("Hello");
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            color: Colors.blue,
                          ),
                          Icon(
                            Icons.comment,
                            color: Colors.lightBlueAccent,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
