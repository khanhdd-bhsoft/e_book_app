import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/customs/error_widget.dart';
import 'package:e_book/core/customs/loading_widget.dart';
import 'package:e_book/core/enum/search_field.dart';
import 'package:e_book/core/helpers/StringHelpers.dart';
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
  final criteriaController = TextEditingController();
  bool _isLoading = false;
  final focusNode = FocusNode();
  final criteriaFocusNode = FocusNode();
  String searchKey = "";
  String searchCriteria = "";
  bool isSearched = false;
  SearchField? searchField;
  SearchField? tempSearchField;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 10 &&
          !_isLoading) {
        setState(() {
          page++;
          _isLoading = true;
        });
        if (searchField != null) {
          BlocProvider.of<SearchVolumeBloc>(context)
              .add(SearchVolumesWithKeyAndParams(
            searchKey: searchKey,
            searchField: searchField!,
          ));
        } else {
          BlocProvider.of<SearchVolumeBloc>(context)
              .add(SearchVolumesWithKey(searchKey: searchKey, page: page));
        }

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
    focusNode.dispose();
    searchController.dispose();
    criteriaController.dispose();
    criteriaFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: buildEndDrawer(context),
      appBar: buildAppBar(),
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
                          physics: const BouncingScrollPhysics(),
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
                return CustomErrorWidget(
                    message: state.message ?? "Something went wrong");
              } else if (state is SearchVolumesLoading) {
                return const LoadingWidget();
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 5,
      title: SizedBox(
        height: 50,
        child: TextField(
          onTap: () {
            setState(() {
              focusNode.requestFocus();
              isSearched = true;
            });
          },
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
              suffixIcon: !isSearched
                  ? const Icon(Icons.search_rounded)
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          searchKey = "";
                          isSearched = false;
                          focusNode.unfocus();
                        });
                      },
                      icon: const Icon(Icons.clear_outlined)),
              hintText: "Search anything ...",
              hintStyle: Theme.of(context).textTheme.bodyLarge),
          onSubmitted: (value) {
            setState(() {
              searchKey = value;
              isSearched = true;
              focusNode.unfocus();
            });
            if (searchField != null) {
              BlocProvider.of<SearchVolumeBloc>(context)
                  .add(SearchVolumesWithKeyAndParams(
                searchKey: searchKey,
                searchField: searchField!,
              ));
            } else {
              BlocProvider.of<SearchVolumeBloc>(context)
                  .add(SearchVolumesWithKey(searchKey: searchKey));
            }
          },
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
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
        ),
      ],
      bottom: searchField != null
          ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (searchField != null) ...{
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 4,
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  criteriaFocusNode.requestFocus();
                                  isSearched = true;
                                });
                              },
                              controller: criteriaController,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: "Enter category",
                                  hintStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          criteriaController.clear();
                                        });
                                      },
                                      icon: const Icon(Icons.clear))),
                              onSubmitted: (value) {
                                setState(() {
                                  page = 1;
                                  // _isLoading=true
                                  searchCriteria = value;
                                  criteriaFocusNode.unfocus();
                                });
                                BlocProvider.of<SearchVolumeBloc>(context)
                                    .add(SearchVolumesWithKeyAndParams(
                                  searchKey: searchKey,
                                  searchField: searchField!,
                                  page: page,
                                ));
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueGrey),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                StringHelpers.getReaableCriteriaText(
                                    searchField!),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  }
                ],
              ))
          : null,
    );
  }

  Widget buildEndDrawer(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Search criteria",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            RadioListTile(
                value: null,
                groupValue: searchField,
                onChanged: (value) {
                  setState(() {
                    searchField = null;
                  });
                },
                title: Text(
                  "Any",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            RadioListTile(
                value: SearchField.intitle,
                groupValue: searchField,
                onChanged: (value) {
                  setState(() {
                    searchField = value;
                  });
                },
                title: Text(
                  "In title",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            RadioListTile(
                value: SearchField.inauthor,
                groupValue: searchField,
                onChanged: (value) {
                  setState(() {
                    searchField = value;
                  });
                },
                title: Text(
                  "In author",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            RadioListTile(
                value: SearchField.inpublisher,
                groupValue: searchField,
                onChanged: (value) {
                  setState(() {
                    searchField = value;
                  });
                },
                title: Text(
                  "In publicer",
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
            RadioListTile(
                value: SearchField.subject,
                groupValue: searchField,
                onChanged: (value) {
                  setState(() {
                    searchField = value;
                  });
                },
                title: Text("Subject",
                    style: Theme.of(context).textTheme.bodyLarge)),
            RadioListTile(
                value: SearchField.isbn,
                groupValue: searchField,
                onChanged: (value) {
                  setState(() {
                    searchField = value;
                  });
                },
                title:
                    Text("ISBN", style: Theme.of(context).textTheme.bodyLarge)),
            RadioListTile(
                value: SearchField.lccn,
                groupValue: searchField,
                onChanged: (value) {
                  setState(() {
                    searchField = value;
                  });
                },
                title:
                    Text("LCCN", style: Theme.of(context).textTheme.bodyLarge)),
            RadioListTile(
              value: SearchField.oclc,
              groupValue: searchField,
              onChanged: (value) {
                setState(() {
                  searchField = value;
                });
              },
              title: Text("OCLC", style: Theme.of(context).textTheme.bodyLarge),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        searchField = null;
                      });
                      _scaffoldKey.currentState?.closeEndDrawer();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.secondaryColor),
                      ),
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "Reset",
                        style: CustomTextStyles.backgroundHeader3TextStyle(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // setState(() {
                      //   searchField = innerSearchField;
                      // });
                      _scaffoldKey.currentState?.closeEndDrawer();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor,
                      ),
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("Apply",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
