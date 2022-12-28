import 'package:flutter/material.dart';
import 'package:hi_beat/src/components.dart';
import 'package:hi_beat/src/res.dart';
import 'package:hi_beat/src/utils.dart';

class SongListLoader extends StatelessWidget {
  const SongListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewsParentContainer(
      padding: const EdgeInsets.only(bottom: 195),
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: fullHeight(context) * 0.1,
            width: fullWidth(context),
            padding: const EdgeInsets.only(left: 15),
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.lightGrey,
                  ),
                ),
                const Gap(dimension: 15),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.black,
                        ),
                      ),
                      const Gap(dimension: 10),
                      Container(
                        height: 10,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Icon(
                    Icons.more_horiz_outlined,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
