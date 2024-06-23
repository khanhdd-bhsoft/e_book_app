import 'package:e_book/core/customs/custom_back_icon.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/customs/loading_widget.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_event.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volumes_by_category/volumes_by_category_state.dart';
import 'package:e_book/features/core_feature/presentation/widgets/volumes/volume_item_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/shimmre_helper.dart';

class VolumesCategoryPage extends StatefulWidget {
  VolumesCategoryPage({super.key, required this.category});
  String category;
  @override
  State<VolumesCategoryPage> createState() => _VolumesCategoryPageState();
}

class _VolumesCategoryPageState extends State<VolumesCategoryPage> {
  ScrollController _scrollController = ScrollController();
  final focusNode = FocusNode();
  int page = 1;
  bool _isLoading = false;
  bool isSearched = false;
  final controller = TextEditingController();
  String searchKey = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<VolumesByCategoryBloc>(context)
        .add(VolumesByCategoryFetch(category: widget.category));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 10 &&
          !_isLoading) {
        setState(() {
          page++;
          _isLoading = true;
        });
        BlocProvider.of<VolumesByCategoryBloc>(context).add(
            VolumesByCategoryFetch(
                category: widget.category, page: page, searchKey: searchKey));
        print("Hey hey hey page is ${page}");
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: BlocBuilder<VolumesByCategoryBloc, VolumesByCategoryState>(
            builder: (context, state) {
              if (state is VolumesByCategoryFetched) {
                if (state.volume != null && state.volume!.items != null) {
                  return ListView.separated(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return VolumeItemWidget(
                            volumeModel: state.volume!.items![index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: state.volume!.items!.length);
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: const Center(
                    child: Text("No data"),
                  ),
                );
              } else if (state is VolumesByCategoryFailed) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Center(
                    child: Text(state.message ?? "Something went wrong"),
                  ),
                );
              } else {
                return ShimmerHelpers.verticalListShimmerView();
              }
            },
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      leading: CustomBackButton(),
      elevation: 5,
      title: Container(
        // padding: EdgeInsets.only(left: 30),
        child: buildAppBarTitle(context),
      ),
      actions: [
        !isSearched
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSearched = true;
                    focusNode.requestFocus();
                  });
                },
                icon: const Icon(Icons.search_rounded))
            : IconButton(
                onPressed: () {
                  setState(() {
                    isSearched = false;
                    focusNode.unfocus();
                  });
                },
                icon: const Icon(Icons.clear)),
      ],
    );
  }

  Widget buildAppBarTitle(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Text(
          widget.category,
          style: CustomTextStyles.header2TextStyle(),
        ),
        secondChild: SizedBox(
          height: 45,
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              hintText: "Search",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    controller.clear();
                    searchKey = "";
                    focusNode.unfocus();
                  });
                },
                icon: const Icon(Icons.clear),
              ),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  searchKey = value;
                  page = 1;
                  context.read<VolumesByCategoryBloc>().add(
                      VolumesByCategoryFetch(
                          category: widget.category,
                          page: page,
                          searchKey: searchKey));
                });
              }
            },
          ),
        ),
        // firstCurve: Curves.fastOutSlowIn,
        // secondCurve: Curves.fastLinearToSlowEaseIn,
        crossFadeState:
            isSearched ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 500));
  }
}
