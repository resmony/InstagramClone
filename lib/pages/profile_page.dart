import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/models/user_model.dart';
import 'package:instagram/pages/edit_profile_page.dart';
import 'package:instagram/utils/constants.dart';

class ProfilePage extends StatefulWidget {
  final String userId;

  ProfilePage({Key key, this.userId}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: usersRef.document(widget.userId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            User user = User.fromDoc(snapshot.data);
            return ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 45.0,
                        backgroundColor: Colors.grey,
                        backgroundImage: user.profileImageURL.isEmpty
                            ? AssetImage('assets/images/user_placeholder.png')
                            : CachedNetworkImageProvider(user.profileImageURL),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text('12',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Text('posts',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('635',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Text('followers',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('145',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Text('following',
                                        style:
                                            TextStyle(color: Colors.black54)),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 190,
                              child: FlatButton(
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            EditProfilePage(user: user))),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 80,
                        child: Text(
                          user.bio,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
