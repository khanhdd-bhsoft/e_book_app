import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/constants/image_data.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dialog_helpers.dart';
import '../../blocs/volume_detail/volume_detail_bloc.dart';
import '../../blocs/volume_detail/volume_detail_event.dart';
import '../../pages/detail_page.dart';

class VolumeGridItem extends StatelessWidget {
  VolumeGridItem({super.key, required this.item});
  Item item;
  @override
  Widget build(BuildContext context) {
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
    return GestureDetector(
      onTap: () async {
        if (item.id != null) {
          BlocProvider.of<VolumeDetailBloc>(context)
              .add(VolumeDetailFetch(id: item.id!));
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const DetailPage();
            },
          ));
        } else {
          await DialogHelpes()
              .showBasicDialog("Cannot open this book", context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 240, 239, 239),
            border: Border.all(color: AppColors.thirdColor.withOpacity(0.5))),
        height: MediaQuery.of(context).size.height * 0.28,
        width: MediaQuery.of(context).size.width * 0.32,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
        // margin: EdgeInsets.symmetric(horizontal: ),
        margin: const EdgeInsets.only(right: 5),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width * 0.36,
              child: image != ""
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image,
                        fit: BoxFit.contain,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(ImageData.placeHolderImage)),
            ),
            // Expanded(
            //     child: Center(
            //   child:
            Text(
              item.volumeInfo!.title!,
              style: CustomTextStyles.normalTextStyle(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            // ))
          ],
        ),
      ),
    );
  }
}
