import 'package:flutter/material.dart';
import 'package:instagram/services/auth_services.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);
  static final String id = 'feed_screen';

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(child: FlatButton(
        onPressed: () => AuthService.logOut(),
        child: Text('Log out'),
      ),),
    );
  }
}