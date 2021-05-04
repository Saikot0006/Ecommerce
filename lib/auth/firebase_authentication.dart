import 'package:firebase_auth/firebase_auth.dart';



class FirebaseAuthentication{
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static User get currentUser => _firebaseAuth.currentUser;

  static Future<User> loginUser(String email,String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  static Future<User>registerUser(String email,String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  static bool get isEmailVerification => _firebaseAuth.currentUser.emailVerified;

  static sendVerificationMail() => _firebaseAuth.currentUser.sendEmailVerification();

  static Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }
}

