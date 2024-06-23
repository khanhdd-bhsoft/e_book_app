import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ShimmerHelpers {
  static Widget horizonalListShimmer(BuildContext context, String title) {
    return AnimationLimiter(
        child: SizedBox(
      width: double.infinity,
      child: Column(
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
                    // function();
                  },
                  child: const Text(
                    "...",
                    // style: CustomTextStyles.seeMoreNormalTextStyle(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                    // verticalOffset: 50.0,
                    scale: 0.5,
                    child: FadeInAnimation(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height * 0.22,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 238, 238),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color.fromARGB(31, 159, 159, 159),
                              blurRadius: 4.0,
                              offset: Offset(0.0, 4.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 16,
            ),
          ),
        ],
      ),
    ));
  }

  static Widget verticalListShimmerView() {
    return AnimationLimiter(
        child: SizedBox(
            width: double.infinity,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: index,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    // scale: 0.5,
                    child: FadeInAnimation(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.14,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 238, 238),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color.fromARGB(31, 159, 159, 159),
                              blurRadius: 4.0,
                              offset: Offset(0.0, 4.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 26,
            )));
  }

  static Widget gridViewShimmer() {
    return AnimationLimiter(
        child: SizedBox(
            width: double.infinity,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                  duration: const Duration(milliseconds: 375),
                  position: index,
                  columnCount: 2,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    // scale: 0.5,
                    child: FadeInAnimation(
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height * 0.22,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 238, 238),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color.fromARGB(31, 159, 159, 159),
                              blurRadius: 4.0,
                              offset: Offset(0.0, 4.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 26,
            )));
  }
}
