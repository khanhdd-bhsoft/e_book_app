import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:e_book/features/core_feature/presentation/widgets/volumes/volume_grid_item.dart';
import 'package:flutter/material.dart';

class CustomListHorizontalCatogory extends StatelessWidget {
  CustomListHorizontalCatogory(
      {super.key,
      required this.listItem,
      required this.title,
      required this.function});
  List<Item> listItem;
  String title;
  Function function;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      // decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
      height: size.height * 0.3,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // padding: const EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.header3TextStyle(),
                ),
                TextButton(
                  onPressed: () async {
                    function();
                  },
                  child: Text(
                    "See all",
                    style: CustomTextStyles.seeMoreNormalTextStyle(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return VolumeGridItem(item: listItem[index]);
                  // return Text(listItem[index].kind!);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 5,
                    ),
                itemCount: listItem.length),
          )
        ],
      ),
    );
  }
}
