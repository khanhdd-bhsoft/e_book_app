import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/customs/custom_back_icon.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/customs/loading_widget.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_state.dart';
import 'package:e_book/features/core_feature/presentation/pages/web_view_page.dart';
import 'package:e_book/features/core_feature/presentation/widgets/volume_detail/book_description_widget.dart';
import 'package:e_book/features/core_feature/presentation/widgets/volume_detail/top_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/dialog_helpers.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: CustomBackButton(),
          actions: [
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: AppColors.favouriteColor,
                )),
            BlocBuilder<VolumeDetailBloc, VolumeDetailState>(
              builder: (context, state) {
                if (state is VolumeDetailFetched) {
                  return IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        if (state.item != null &&
                            state.item!.volumeInfo != null &&
                            state.item!.accessInfo != null &&
                            state.item!.accessInfo!.pdf!.isAvailable!) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return WebviewPage(
                                  pageName: state.item!.volumeInfo!.title!,
                                  url: state
                                      .item!.accessInfo!.pdf!.acsTokenLink!);
                            },
                          ));
                        }
                      },
                      icon: const Icon(
                        Icons.download_for_offline_outlined,
                      ));
                }
                return IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download_for_offline_outlined,
                    ));
              },
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<VolumeDetailBloc, VolumeDetailState>(
            builder: (context, state) {
              if (state is VolumeDetailInitial) {
                return const SizedBox();
              } else if (state is VolumeDetailFetched) {
                if (state.item != null) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                      children: [
                        TopDetailWidget(item: state.item!),
                        BookDescriptionWidget(
                            description: state.item!.volumeInfo!.description!),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: Text("Value is null"),
                );
              } else if (state is VolumeDetailFailed) {
                return Center(
                  child: Text(state.message ?? "Something went wrong"),
                );
              } else {
                return const LoadingWidget();
              }
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<VolumeDetailBloc, VolumeDetailState>(
          builder: (context, state) {
            return InkWell(
              onTap: () async {
                if (state is VolumeDetailFetched) {
                  if (state.item != null &&
                      state.item!.volumeInfo != null &&
                      state.item!.accessInfo != null &&
                      state.item!.accessInfo!.webReaderLink != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return WebviewPage(
                            pageName: state.item!.volumeInfo!.title!,
                            url: state.item!.accessInfo!.webReaderLink!);
                      },
                    ));
                  }
                } else {
                  await DialogHelpes()
                      .showBasicDialog("Cannot open read this book", context);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: state is VolumeDetailFetched
                        ? AppColors.secondaryColor
                        : AppColors.unenabledColor),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: Center(
                  child: Text(
                    "Read book",
                    style: CustomTextStyles.header3TextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
