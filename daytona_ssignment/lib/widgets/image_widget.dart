import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  /* final double size; */
  final String? imageUrl;
  final BoxFit? fit;
  final double? height, width;
  /* final Color? color;
  final bool? boxShadow; */
  const CustomNetworkImage(this.imageUrl,
      {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl ??
          "https://www.unfe.org/wp-content/uploads/2019/04/SM-placeholder.png",
      fit: fit ?? BoxFit.cover,
      /*     imageBuilder: (context, imageProvider) {
        return Container(
          height: size,
          width: size,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(size / 2),
              border: Border.all(color: color ?? AppColors.pink, width: 1.5),
              boxShadow: boxShadow ?? true
                  ? [
                      BoxShadow(
                          offset: const Offset(0, 9),
                          blurRadius: 20.0,
                          color: Colors.black.withOpacity(0.25))
                    ]
                  : null,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              )
              // shape: BoxShape.circle,
              ),
        );
      }, */
      progressIndicatorBuilder: (context, url, progress) => Container(
          alignment: Alignment.center,
          /*    height: size,
          width: size, */
          color: Colors.white,
          /*   decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            border: Border.all(color: color ?? AppColors.pink, width: 1.5),
            boxShadow: boxShadow ?? true
                ? [
                    BoxShadow(
                        offset: const Offset(0, 9),
                        blurRadius: 20.0,
                        color: Colors.black.withOpacity(0.25))
                  ]
                : null,

            // shape: BoxShape.circle,
          ), */
          child: const CircularProgressIndicator()),
      errorWidget: (context, url, error) => Container(
        alignment: Alignment.center,
        /* height: size,
        width: size, */
        color: Colors.white,
        child: const Icon(
          Icons.error,
          color: Colors.red,
          size: 15,
        ),
      ),
    );
  }
}
