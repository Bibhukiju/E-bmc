import 'dart:io';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';

class UserPostPage extends StatefulWidget {
  UserPostPage({Key key}) : super(key: key);

  @override
  _UserPostPageState createState() => _UserPostPageState();
}

class _UserPostPageState extends State<UserPostPage> {
  Color mainTitleBarColor = Colors.blue[400];
  Color mainBodyColor = Colors.grey[300];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // 1st title block
          TitleClass(
            colour: mainTitleBarColor,
            text: 'Create A Post',
            marginTop: 0.0,
            marginBottom: 0.0,
          ),

          // 2nd title block where image is to be added
          TitleClass(
            colour: mainTitleBarColor,
            text: 'Add A Image',
            marginTop: 10.0,
            marginBottom: 0.0,
          ),
          ImagePost(),
          //3rd block for heading
          TitleClass(
            colour: mainTitleBarColor,
            text: 'Heading',
            marginTop: 0.0,
            marginBottom: 0.0,
          ),
          Expanded(
            child: MainBody(
              marginTop: 0.0,
              marginBottom: 10.0,
              hintTitle: 'Enter the Title of  The Post',
            ),
          ),

          // 4th Block of title for the descreption
          TitleClass(
            colour: mainTitleBarColor,
            text: 'Enter The Descreption',
            marginTop: 10.0,
            marginBottom: 0.0,
          ),
          Expanded(
            child: MainBody(
              marginTop: 0.0,
              marginBottom: 10.0,
              hintTitle: 'Enter the Descreption Of The Post',
            ),
          ),
          // last submit buttom
          Center(
            child: FlatButton(
              onPressed: () {
                print("Posted");
              },
              child: Container(
                child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[300],
                    shadowColor: Colors.blueAccent,
                    elevation: 5.0,
                    child: Center(
                      child: Text(
                        'POST',
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    )),
                height: 40.0,
                width: 100.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

// image post widget is used for add a image section where users select image
class ImagePost extends StatefulWidget {
  ImagePost({Key key}) : super(key: key);

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  File imageFile;
  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make A Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Expanded(
        child: Text(
          'No Image Selected',
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      );
    } else {
      return Expanded(
        child: Image.file(imageFile),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 7.0),
        child: Column(
          children: <Widget>[
            _decideImageView(),
            Expanded(
              child: RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text(
                  'Select Image',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleClass extends StatelessWidget {
  final Color colour;
  final String text;
  final double marginTop, marginBottom;
  TitleClass(
      {@required this.colour, this.text, this.marginTop, this.marginBottom});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.fromLTRB(0.0, marginTop, 0.0, marginBottom),
      color: colour,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  MainBody({this.marginTop, this.marginBottom, this.hintTitle});
  final double marginTop, marginBottom;
  final String hintTitle;
  @override
  State<StatefulWidget> createState() {
    return MainBodyImpl(
      marginTop: this.marginTop,
      marginBottom: this.marginBottom,
      hintTitle: this.hintTitle,
    );
  }
}

class MainBodyImpl extends State<MainBody> {
  final double marginTop, marginBottom;
  final String hintTitle;
  String result = '';
  MainBodyImpl({
    this.marginTop,
    this.marginBottom,
    this.hintTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.fromLTRB(0.0, marginTop, 0.0, marginBottom),
      color: Colors.grey[300],
      child: TextField(
        style: TextStyle(fontSize: 22.0, color: Colors.white),
        decoration: InputDecoration(
          hintText: hintTitle,
        ),
        onSubmitted: (String str) {
          setState(() {
            result = str;
          });
        },
      ),
    );
  }
}
