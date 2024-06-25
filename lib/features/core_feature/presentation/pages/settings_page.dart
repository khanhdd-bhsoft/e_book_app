import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/utils/dialog_helpers.dart';
import 'package:e_book/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/data/data_sources/auth_data_source.dart';
import '../../../auth/presentation/blocs/auth_event.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          "Setings",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: AppColors.backroundColor,
              splashColor: AppColors.itemCardColor,
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.2))),
                child: ListTile(
                  leading: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Favourite",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: AppColors.backroundColor,
              splashColor: AppColors.itemCardColor,
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.2))),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.download,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Download",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.secondaryColor.withOpacity(0.2))),
              child: ListTile(
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "Dark mode",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                trailing: BlocBuilder<ThemeCubit, bool>(
                  builder: (context, state) => Switch(
                    value: state,
                    onChanged: (value) {
                      context.read<ThemeCubit>().changeTheme(value);
                    },
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: AppColors.backroundColor,
              splashColor: AppColors.itemCardColor,
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.2))),
                child: ListTile(
                  leading: const Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: Text(
                    "About",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: AppColors.backroundColor,
              splashColor: AppColors.itemCardColor,
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.2))),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.description_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "License",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ),
            // const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              highlightColor: AppColors.warningColor,
              splashColor: AppColors.favouriteColor,
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.2))),
                child: ListTile(
                  onTap: () async {
                    // AuthDataSource _authDataSource = AuthDataSource();
                    // await _authDataSource.signOut();
                    await DialogHelpes().showLogoutDialog(
                        context, "Are you sure to logout", () async {
                      context.read<AuthBloc>().add(SignOutEvent());
                    });
                  },
                  leading: const Icon(
                    Icons.logout_outlined,
                    color: AppColors.warningColor,
                  ),
                  title: Text(
                    "Log out",
                    style: CustomTextStyles.warningTextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
