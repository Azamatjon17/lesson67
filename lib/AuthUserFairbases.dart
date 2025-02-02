import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authuserfairbases {
  final firaebase = FirebaseAuth.instance;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    await firaebase.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await firaebase.signInWithEmailAndPassword(email: email, password: password);
  }
}
