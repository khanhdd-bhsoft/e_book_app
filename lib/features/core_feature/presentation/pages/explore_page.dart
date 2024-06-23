import 'package:e_book/core/constants/list_category.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/customs/loading_widget.dart';
import 'package:e_book/core/helpers/shimmre_helper.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/list_default_category/default_categories_state.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_event.dart';
import 'package:e_book/features/core_feature/presentation/pages/volumes_category_page.dart';
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
              return Scrollbar(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (state.listData[index]
                                  [state.listData[index].keys.first] !=
                              null &&
                          state
                                  .listData[index]
                                      [state.listData[index].keys.first]!
                                  .items !=
                              null) {
                        return CustomListHorizontalCatogory(
                          function: () {
                            // context.read<VolumesByCategoryBloc>().add(
                            //     VolumesByCategoryFetch(
                            //         category: state.listData[index].keys.first));
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return VolumesCategoryPage(
                                    category: state.listData[index].keys.first);
                              },
                            ));
                          },
                          listItem: state
                              .listData[index]
                                  [state.listData[index].keys.first]!
                              .items!,
                          title: state.listData[index].keys.first,
                        );
                      }
                      return CustomErrorWidget(
                        message: "No data",
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: state.listData.length),
              );
            } else if (state is DefaultCategoriesFailed) {
              return CustomErrorWidget(
                message: state.message ?? "Something went wrong",
              );
            } else {
              return ListView(
                children: List.generate(
                  defaultListCategory.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ShimmerHelpers.horizonalListShimmer(
                        context, defaultListCategory[index]),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
