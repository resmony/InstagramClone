import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  CreatePostPage({Key key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(child: Text('create post screen'),),
    );
  }
}