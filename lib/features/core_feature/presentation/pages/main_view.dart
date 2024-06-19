import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/features/core_feature/presentation/blocs/nav/nav_cubit.dart';
import 'package:e_book/features/core_feature/presentation/pages/explore_page.dart';
import 'package:e_book/features/core_feature/presentation/pages/main_page.dart';
import 'package:e_book/features/core_feature/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  final itemBottomNavBar = [
    const BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.home_outlined),
        label: "Home"),
    const BottomNavigationBarItem(
      icon: Icon(Icons.explore_outlined),
      label: "Explore",
      backgroundColor: Colors.white,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: "Settings",
      backgroundColor: Colors.white,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavCubit, int>(
        builder: (context, state) {
          if (state == 0) {
            return const MainPage();
          } else if (state == 1) {
            return const ExplorePage();
          }
          return const SettingsPage();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavCubit, int>(
        builder: (context, state) => BottomNavigationBar(
          backgroundColor: AppColors.thirdColor,
          elevation: 5,
          items: itemBottomNavBar,
          currentIndex: state,
          onTap: (value) {
            context.read<NavCubit>().navigateTo(value);
          },
        ),
      ),
    );
  }
}
