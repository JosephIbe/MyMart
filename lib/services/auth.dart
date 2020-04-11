import 'package:firebase_auth/firebase_auth.dart';
import 'package:g_mart/models/user.dart';
import 'package:g_mart/services/database.dart';

class AuthService {

  FirebaseAuth _mAuth = FirebaseAuth.instance;

  Stream<User> get user {
    return _mAuth.onAuthStateChanged.map(_mapUserFromFirebase);
  }

  User _mapUserFromFirebase(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(userId: firebaseUser.uid) : null;
  }

  Future<String> getCurrentUID() async {
    FirebaseUser firebaseUser = await _mAuth.currentUser();
    String currID = firebaseUser.uid.toString();
    return currID;
  }

  Future createUser(String email, String pwd, String username, String role) async{
    try {
      AuthResult result = await _mAuth.createUserWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser firebaseUser = result.user;

      //todo add uid field to each collection
      await DatabaseService(userId: firebaseUser.uid).setUserData(email: email, role: role, username: username);
      return _mapUserFromFirebase(firebaseUser);
    } catch(e){
      print(e.toString());
      return e;
    }
  }

  Future loginUser(String email, String pwd) async {
    try {
      AuthResult authResult = await _mAuth.signInWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser firebaseUser = authResult.user;
      return _mapUserFromFirebase(firebaseUser);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _mAuth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}