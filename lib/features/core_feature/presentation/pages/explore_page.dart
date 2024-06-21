import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/customs/custom_list_horizontal_category.dart';
import '../../../../core/customs/error_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        title: Text(
          "Explore",
          style: CustomTextStyles.header2TextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
        child: BlocBuilder<DefaultCategoriesBloc, DefaultCategoriesState>(
          builder: (context, state) {
            if (state is DefaultCategoriesFetched) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return CustomListHorizontalCatogory(
                      function: () {
                        // return
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: state.listData.length);
            } else if (state is DefaultCategoriesFailed) {
              return CustomErrorWidget(
                message: state.message ?? "Somehin went wrong",
              );
            }
          },
        ),
      ),
    );
  }
}
