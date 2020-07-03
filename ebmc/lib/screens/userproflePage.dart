import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 4,
                backgroundColor: Colors.lightBlue[200],
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width / 5,
                backgroundImage: NetworkImage(
                    "https://scontent.fktm7-1.fna.fbcdn.net/v/t1.15752-9/97599062_693367938119509_6623952121580486656_n.jpg?_nc_cat=107&_nc_sid=b96e70&_nc_eui2=AeHGozkLfUB4IJyDlt8FySknYu1ZVsSt9Sxi7VlWxK31LFKdgwB0-oWkMTbJIksKpDjRD5vLu3a30Vgm5HNOvUpZ&_nc_ohc=PRVe3jMAKJoAX9jwFpF&_nc_ht=scontent.fktm7-1.fna&oh=c95e44be4c1bf5193f308f1304918b93&oe=5F24181B"),
              ),
            ],
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.lightBlue,
          child: Text(
            "Follow",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {},
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("Matlabai Bhayena ni")),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.alternate_email,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(width: 20),
                        Expanded(child: Text("matlabai@bhayenani.com")),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.all_out,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                                text:
                                    "Bio napadhesi ta !  Bio ma lekheko ta matlabai bhayena ni"),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
