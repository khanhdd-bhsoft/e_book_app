import 'package:e_book/core/injection/injection_dependencies.dart';
import 'package:e_book/features/auth/data/data_sources/auth_data_source.dart';
import 'package:e_book/features/auth/domain/usecases/get_current_user_uc.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:e_book/features/core_feature/presentation/pages/main_page.dart';
import 'package:e_book/features/core_feature/presentation/pages/main_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RootPage extends StatefulWidget {
  RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // AuthDataSource _authDataSource = AuthDataSource();
  // GoogleSignIn _googleSignIn = GoogleSignIn(
  //     scopes: ['email'],
  //     serverClientId:
  //         '409773099382-hq8pa21ea2s7t8e3fmv8ej6jf6rfnnm0.apps.googleusercontent.com');
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    // _authDataSource.user.listen((user) {
    //   print("I am in this one");
    //   setState(() {
    //     _currentUser = user;
    //   });
    // });
    sl.get<AuthDataSource>().signInSilently();
  }

  @override
  void dispose() {
    // _authDataSource.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: sl.get<FirebaseAuth>().authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            return MainView();
          } else {
            return const SignInPage();
          }
        } else {
          return const Scaffold();
        }
      },
    );
    // _currentUser != null ? MainView() : const SignInPage();
  }
}
    // StreamBuilder(
    //   stream: _authDataSource.user,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active ||
    //         snapshot.connectionState == ConnectionState.done) {
    //       final user = snapshot.data;
    //       if (user != null) {
    //         // print('Autho');
    //         // WidgetsBinding.instance.addPostFrameCallback((_) {

    //         // });
    //         return MainView();
    //       } else {
    //         // print('Unauthor');
    //         // WidgetsBinding.instance.addPostFrameCallback((_) {});
    //         return const SignInPage();
    //       }
    //     } else if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const SizedBox();
    //     } else {
    //       return const SignInPage();
    //     }
    //   },
    // );