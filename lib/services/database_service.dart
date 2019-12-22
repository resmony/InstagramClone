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
}
