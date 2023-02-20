import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FoodsShimmer extends StatelessWidget {
  const FoodsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      child: GridView.builder(
        // controller: scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 18,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 1.1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) => Shimmer.fromColors(
          highlightColor: Colors.red,
          baseColor: Colors.white,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
