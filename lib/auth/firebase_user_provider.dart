import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BayLifeWebFirebaseUser {
  BayLifeWebFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

BayLifeWebFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BayLifeWebFirebaseUser> bayLifeWebFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BayLifeWebFirebaseUser>(
            (user) => currentUser = BayLifeWebFirebaseUser(user));
