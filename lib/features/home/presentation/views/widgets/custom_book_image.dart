import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        /// Ratio between width to height
        aspectRatio: 2.8 / 4,
        child: CachedNetworkImage(
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          )),
          errorWidget: (context, url, error) => SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.purple[800]!,
              highlightColor: Colors.grey,
              child: const Icon(Icons.error, size: 55),
            ),
          ),
          imageUrl: imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
