import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MoviePlaceHolder extends StatelessWidget {
  final double width;
  final double height;

  const MoviePlaceHolder({
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

class ContentPlaceHolder extends StatelessWidget {
  const ContentPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MoviePlaceHolder(height: 50),
            SizedBox(height: 15),
            MoviePlaceHolder(height: 300),
            SizedBox(height: 15),
            MoviePlaceHolder(height: 40, width: 80),
            SizedBox(height: 15),
            MoviePlaceHolder(height: 40),
            SizedBox(height: 15),
            MoviePlaceHolder(height: 40, width: 80),
            SizedBox(height: 15),
            MoviePlaceHolder(height: 200),
          ],
        ),
      ),
    );
  }
}
