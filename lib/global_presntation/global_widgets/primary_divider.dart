import 'package:flutter/material.dart';

class PrimaryDivider extends StatelessWidget {
  final double? width;
  final double? height;
  final int ?colorValueOfDivider;
  const PrimaryDivider(this.colorValueOfDivider,{Key? key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: Color(colorValueOfDivider!),
    );
  }
}
