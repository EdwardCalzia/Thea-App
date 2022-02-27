import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HackathonFeb22FirebaseUser {
  HackathonFeb22FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

HackathonFeb22FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HackathonFeb22FirebaseUser> hackathonFeb22FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<HackathonFeb22FirebaseUser>(
            (user) => currentUser = HackathonFeb22FirebaseUser(user));
