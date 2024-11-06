import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/app_color.dart';

class ShimmerBase extends StatelessWidget {
  final Widget child;
  final Color baseColor, highlightColor;

  const ShimmerBase({
    super.key,
    required this.child,
    this.baseColor = AppColor.shimmerBaseColor,
    this.highlightColor = AppColor.shimmerHighlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}
