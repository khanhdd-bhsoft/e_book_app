import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/utils/common_methods.dart';
import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:e_book/features/core_feature/presentation/pages/web_view_page.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/image_data.dart';

class TopDetailWidget extends StatelessWidget {
  TopDetailWidget({super.key, required this.item});
  Item item;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String image = "";
    if (item.volumeInfo!.imageLinks != null) {
      if (item.volumeInfo!.imageLinks!.medium != null) {
        image = item.volumeInfo!.imageLinks!.medium!;
      } else if (item.volumeInfo!.imageLinks!.thumbnail != null) {
        image = item.volumeInfo!.imageLinks!.thumbnail!;
      } else if (item.volumeInfo!.imageLinks!.large != null) {
        image = item.volumeInfo!.imageLinks!.large!;
      } else if (item.volumeInfo!.imageLinks!.small != null) {
        image = item.volumeInfo!.imageLinks!.small!;
      } else if (item.volumeInfo!.imageLinks!.smallThumbnail != null) {
        image = item.volumeInfo!.imageLinks!.smallThumbnail!;
      }
    }
    return Container(
      // height: size.height * 0.18,

      width: size.width * 0.98,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: size.height * 0.18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: size.height * 0.18,
                      child: image != ""
                          ? Image.network(
                              image,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              ImageData.placeHolderImage,
                              fit: BoxFit.contain,
                            ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (item.volumeInfo != null &&
                              item.accessInfo != null &&
                              item.accessInfo!.webReaderLink != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return WebviewPage(
                                    pageName: item.volumeInfo!.title!,
                                    url: item.accessInfo!.webReaderLink!);
                              },
                            ));
                          }
                        },
                        child: Text(
                          "Read book",
                          style: CustomTextStyles.header3TextStyle(),
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.volumeInfo!.title ?? "Title ...",
                        style: CustomTextStyles.headerTextStyle(),
                        overflow: TextOverflow.clip,
                      ),
                      if (item.volumeInfo!.authors != null &&
                          item.volumeInfo!.authors!.isNotEmpty)
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: CommonMethods.buildAuthorsWithCommas(
                              item.volumeInfo!.authors!),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (item.volumeInfo!.categories != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: CustomTextStyles.header3TextStyle(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      item.volumeInfo!.categories![index],
                      style: CustomTextStyles.normalTextStyle(),
                    ),
                  ),
                  itemCount: item.volumeInfo!.categories!.length,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
