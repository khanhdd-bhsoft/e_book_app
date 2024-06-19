import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search_volumes/search_volumes_state.dart';
import '../widgets/volumes/list_volumes_widget.dart';
import '../widgets/volumes/volume_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController = ScrollController();
  int page = 1;
  final searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 10) {
        setState(() {
          page++;
        });
        BlocProvider.of<SearchVolumeBloc>(context).add(
            SearchVolumesWithKey(searchKey: searchController.text, page: page));
        print("Hey hey hey page is ${page}");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            textInputAction: TextInputAction.search,
            controller: searchController,
            decoration: InputDecoration(
                focusColor: AppColors.backroundColor,
                hoverColor: AppColors.backroundColor,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Colors.blueGrey, width: 0.3),
                ),
                suffixIcon: const Icon(Icons.search_rounded),
                hintText: "Search anything ..."),
            onSubmitted: (value) {
              BlocProvider.of<SearchVolumeBloc>(context)
                  .add(SearchVolumesWithKey(searchKey: value));
            },
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.thirdColor),
              child: const Icon(
                Icons.filter_list_outlined,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: BlocBuilder<SearchVolumeBloc, SearchVolumesState>(
            builder: (context, state) {
              if (state is SearchVolumesFetched) {
                return SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.volumesModel!.kind ?? "kind"),
                            Text(state.volumesModel!.totalItems != null
                                ? "${state.volumesModel!.totalItems} items"
                                : "... items"),
                          ],
                        ),
                      ),
                      ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return VolumeItemWidget(
                              volumeModel: state.volumesModel!.items![index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: state.volumesModel!.items!.length)
                    ],
                  ),
                );
              } else if (state is SearchVolumesFailed) {
                return Center(
                  child: Text(state.message ?? "Something went wrong"),
                );
              } else if (state is SearchVolumesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
