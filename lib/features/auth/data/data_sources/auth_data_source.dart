import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSource {
  FirebaseAuth auth;
  final List<String> scopes = <String>['email'];
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // clientId:
    //    ,
    // serverClientId:
    //     '409773099382-hq8pa21ea2s7t8e3fmv8ej6jf6rfnnm0.apps.googleusercontent.com',
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  GoogleSignInAccount? googleAccount;
  late StreamController<GoogleSignInAccount?> _userController =
      StreamController<GoogleSignInAccount?>.broadcast();
  AuthDataSource({required this.auth}) {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _userController.add(account);
    });
  }
  Future<void> signInSilently() async {
    await _googleSignIn.signInSilently();
  }

  Future<void> checkSignInStatus() async {
    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signInSilently();
      } else {
        _userController.add(null);
      }
    } catch (e) {
      _userController.add(null);
      print("Error checking sign-in status: $e");
    }
  }

  Future<void> handleSignIn() async {
    try {
      googleAccount = await _googleSignIn.signIn();
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
      }
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await auth.signOut();
    } catch (e) {
      print("An error has occurred: ${e.toString()}");
    }
  }

  Stream<GoogleSignInAccount?> get user async* {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _userController.add(account);
    });
    _userController.onCancel = () {
      _userController.close();
    };
    yield* _userController.stream;
  }

  void dispose() {
    _userController.close();
  }
}
