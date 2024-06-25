import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/constants/image_data.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/auth_data_source.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
            colors: [
              AppColors.secondaryColor,
              AppColors.itemCardColor,
              AppColors.favouriteColor
            ],
            stops: [0, 1, 0],
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Login to the app",
                style: CustomTextStyles.headerTextStyle(),
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            InkWell(
              onTap: () async {
                // AuthDataSource _authDataSource = AuthDataSource();
                // await _authDataSource.handleSignIn();
                context.read<AuthBloc>().add(SignInEvent());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.appBorderColor),
                    color: AppColors.backroundColor.withOpacity(0.7)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageData.googleLogoImage,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      "Sign in with Google",
                      style: CustomTextStyles.header2TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
