import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/constants/image_data.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/utils/dialog_helpers.dart';
import 'package:e_book/features/core_feature/data/models/volume/item.dart';
import 'package:e_book/features/core_feature/data/models/volume_model.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_bloc.dart';
import 'package:e_book/features/core_feature/presentation/blocs/volume_detail/volume_detail_event.dart';
import 'package:e_book/features/core_feature/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeItemWidget extends StatelessWidget {
  VolumeItemWidget({super.key, required this.volumeModel});
  Item volumeModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String image = "";
    if (volumeModel.volumeInfo!.imageLinks != null) {
      if (volumeModel.volumeInfo!.imageLinks!.medium != null) {
        image = volumeModel.volumeInfo!.imageLinks!.medium!;
      } else if (volumeModel.volumeInfo!.imageLinks!.thumbnail != null) {
        image = volumeModel.volumeInfo!.imageLinks!.thumbnail!;
      } else if (volumeModel.volumeInfo!.imageLinks!.large != null) {
        image = volumeModel.volumeInfo!.imageLinks!.large!;
      } else if (volumeModel.volumeInfo!.imageLinks!.small != null) {
        image = volumeModel.volumeInfo!.imageLinks!.small!;
      } else if (volumeModel.volumeInfo!.imageLinks!.smallThumbnail != null) {
        image = volumeModel.volumeInfo!.imageLinks!.smallThumbnail!;
      }
    }

    return GestureDetector(
      onTap: () async {
        if (volumeModel.id != null) {
          BlocProvider.of<VolumeDetailBloc>(context)
              .add(VolumeDetailFetch(id: volumeModel.id!));
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
            borderRadius: BorderRadius.circular(5),
            color: AppColors.itemCardColor),
        height: size.height * 0.14,
        width: size.width * 0.9,
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              height: size.height * 0.14,
              width: size.height * 0.14,
              child: image != ""
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        ImageData.placeHolderImage,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (volumeModel.volumeInfo != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 2),
                        child: Text(
                          volumeModel.volumeInfo!.title ?? "...",
                          style: CustomTextStyles.header3TextStyle(),
                          maxLines: 2,
                        ),
                      ),
                    if (volumeModel.saleInfo != null)
                      Text(
                        volumeModel.saleInfo!.isEbook != null
                            ? volumeModel.saleInfo!.isEbook!
                                ? "Ebook"
                                : "Book"
                            : "...",
                        style: CustomTextStyles.normalTextStyle(),
                      ),
                    if (volumeModel.volumeInfo != null)
                      Text(
                        volumeModel.volumeInfo!.contentVersion ??
                            "Content version",
                        style: CustomTextStyles.normalTextStyle(),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
