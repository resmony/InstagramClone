import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/models/user_model.dart';
import 'package:instagram/utils/constants.dart';

class DatabaseService {
  static void updateUser(User user) {
    usersRef.document(user.id).updateData({
      'name': user.name,
      'profileImageURL': user.profileImageURL,
      'bio': user.bio,
      'email': user.email
    });
  }

  static Future<QuerySnapshot> searchUsers(String query) async {
    Future<QuerySnapshot> users = usersRef
        .where('name'.toLowerCase(),
            isGreaterThanOrEqualTo: query.toLowerCase())
        .getDocuments();
    return users;
  }

  static void createPost(Post post) {
    postsRef.document(post.authorId).collection('usersPost').add({
      'imageUrl': post.imageUrl,
      'caption': post.caption,
      'likes': post.likes,
      'authorId': post.authorId,
      'timestamp': post.timestamp
    });
  }
}
