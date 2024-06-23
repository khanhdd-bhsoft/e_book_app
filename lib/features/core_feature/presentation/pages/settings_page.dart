import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/features/core_feature/presentation/blocs/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setings",
          style: CustomTextStyles.header2TextStyle(),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.secondaryColor.withOpacity(0.5))),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
                title: Text(
                  "Favourite",
                  style: CustomTextStyles.header3TextStyle(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.secondaryColor.withOpacity(0.5))),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.download,
                  color: Colors.black,
                ),
                title: Text(
                  "Download",
                  style: CustomTextStyles.header3TextStyle(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.secondaryColor.withOpacity(0.5))),
              child: ListTile(
                leading: const Icon(
                  Icons.dark_mode_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "Dark mode",
                  style: CustomTextStyles.header3TextStyle(),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.secondaryColor.withOpacity(0.5))),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                title: Text(
                  "About",
                  style: CustomTextStyles.header3TextStyle(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.secondaryColor.withOpacity(0.5))),
              child: ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.description_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "License",
                  style: CustomTextStyles.header3TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
