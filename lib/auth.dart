import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
 // FirebaseUser user;


  //create user object based on firebase user
  
  User _userFromFirebaseUser(FirebaseUser user) {
    
    return user != null? User(uid: user.uid) : null;
    
  }

  // Auth Change user stream

  Stream<User> get user {

    return _auth.onAuthStateChanged

      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);

  }

  // Sign in anom

  Future signInAnom() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
  } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // Sign with email and pwd
  Future signInWithEmailandPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      print(email);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // register with email and pwd
  Future registerWithEmailandPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
  try{
  return await _auth.signOut();
  }catch(e){
   print(e.toString());
   return null;
  }
}

}