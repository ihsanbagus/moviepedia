import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TitlePlaceHolder extends StatelessWidget {
  final double width;
  final double height;

  const TitlePlaceHolder({
    Key? key,
    this.width = double.infinity,
    this.height = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

class MoviePlaceHolder extends StatelessWidget {
  const MoviePlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200.0,
          height: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 11),
        const TitlePlaceHolder(width: 200.0, height: 11.0),
      ],
    );
  }
}

class ContentPlaceHolder extends StatelessWidget {
  const ContentPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 11),
          const TitlePlaceHolder(width: 200.0, height: 21.0),
          const SizedBox(height: 11),
          Row(
            children: const [
              MoviePlaceHolder(),
              SizedBox(width: 11),
              MoviePlaceHolder(),
              SizedBox(width: 11),
              MoviePlaceHolder(),
            ],
          ),
        ],
      ),
    );
  }
}
