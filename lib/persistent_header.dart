// ignore: file_names

import 'dart:math';

import 'package:flutter/material.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

SliverPersistentHeader makeHeader(String headerTitle, double width) {
  return SliverPersistentHeader(
    pinned: true,
    floating: true,
    delegate: _SliverAppBarDelegate(
      minHeight: 60.0,
      maxHeight: 175.0,
      child: SizedBox(
        height: 200,
        width: width,
        child: Image.asset(
          'assets/images/1.jpg',
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
