import 'package:flutter/material.dart';

class PrimaryImage extends StatelessWidget {
  final String urlOfImage;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final void Function()?funtion;
  const PrimaryImage(this.urlOfImage,
      {Key? key, this.width, this.height, this.fit,this.funtion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funtion,
      child: Image.asset(
        urlOfImage,
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }
}
