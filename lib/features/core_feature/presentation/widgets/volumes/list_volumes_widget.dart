import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_event.dart';
import 'package:e_book/features/core_feature/presentation/blocs/search_volumes/search_volumes_state.dart';
import 'package:e_book/features/core_feature/presentation/widgets/volumes/volume_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListVolumesWidget extends StatefulWidget {
  ListVolumesWidget({super.key, required this.searchKey});
  String searchKey;
  @override
  State<ListVolumesWidget> createState() => _ListVolumesWidgetState();
}

class _ListVolumesWidgetState extends State<ListVolumesWidget> {
  ScrollController _scrollController = ScrollController();
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent - 20) {
        BlocProvider.of<SearchVolumeBloc>(context).add(
            SearchVolumesWithKey(searchKey: widget.searchKey, page: page++));
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
    return BlocBuilder<SearchVolumeBloc, SearchVolumesState>(
      builder: (context, state) {
        if (state is SearchVolumesFetched) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.volumesModel!.kind ?? "kind"),
                    Text(state.volumesModel!.totalItems != null
                        ? "${state.volumesModel!.totalItems} items"
                        : "... items"),
                  ],
                ),
                ListView.separated(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
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
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
