import 'package:flutter/material.dart';

final class AppPadding extends EdgeInsets {
  ///All Lines Padding
  const AppPadding.allXXSmall() : super.all(2);
  const AppPadding.allXSmall() : super.all(4);
  const AppPadding.allSmall() : super.all(8);
  const AppPadding.allMedium() : super.all(10);
  const AppPadding.allNormal() : super.all(12);
  const AppPadding.allLarge() : super.all(14);
  const AppPadding.allXLarge() : super.all(16);
  const AppPadding.allXXLarge() : super.all(20);

  ///Horizontal Padding
  const AppPadding.symHXXSmall() : super.symmetric(horizontal: 2);
  const AppPadding.symHXSmall() : super.symmetric(horizontal: 4);
  const AppPadding.symHSmall() : super.symmetric(horizontal: 8);
  const AppPadding.symHMedium() : super.symmetric(horizontal: 10);
  const AppPadding.symHNormal() : super.symmetric(horizontal: 12);
  const AppPadding.symHLarge() : super.symmetric(horizontal: 14);
  const AppPadding.symHXLarge() : super.symmetric(horizontal: 16);
  const AppPadding.symHXXLarge() : super.symmetric(horizontal: 20);

  ///Vertical Padding
  const AppPadding.symVXXSmall() : super.symmetric(vertical: 2);
  const AppPadding.symVXSmall() : super.symmetric(vertical: 4);
  const AppPadding.symVSmall() : super.symmetric(vertical: 8);
  const AppPadding.symVMedium() : super.symmetric(vertical: 10);
  const AppPadding.symVNormal() : super.symmetric(vertical: 12);
  const AppPadding.symVLarge() : super.symmetric(vertical: 14);
  const AppPadding.symVXLarge() : super.symmetric(vertical: 16);
  const AppPadding.symVXXLarge() : super.symmetric(vertical: 20);

  ///Only Right Padding
  const AppPadding.rightXXSmall() : super.only(right: 2);
  const AppPadding.rightXSmall() : super.only(right: 4);
  const AppPadding.rightSmall() : super.only(right: 8);
  const AppPadding.rightMedium() : super.only(right: 10);
  const AppPadding.rightNormal() : super.only(right: 12);
  const AppPadding.rightLarge() : super.only(right: 14);
  const AppPadding.rightXLarge() : super.only(right: 16);
  const AppPadding.rightXXLarge() : super.only(right: 20);

  ///Only Left Padding
  const AppPadding.leftXXSmall() : super.only(left: 2);
  const AppPadding.leftXSmall() : super.only(left: 4);
  const AppPadding.leftSmall() : super.only(left: 8);
  const AppPadding.leftMedium() : super.only(left: 10);
  const AppPadding.leftNormal() : super.only(left: 12);
  const AppPadding.leftLarge() : super.only(left: 14);
  const AppPadding.leftXLarge() : super.only(left: 16);
  const AppPadding.leftXXLarge() : super.only(left: 20);

  ///Only Top Padding
  const AppPadding.topXXSmall() : super.only(top: 2);
  const AppPadding.topXSmall() : super.only(top: 4);
  const AppPadding.topSmall() : super.only(top: 8);
  const AppPadding.topMedium() : super.only(top: 10);
  const AppPadding.topNormal() : super.only(top: 12);
  const AppPadding.topLarge() : super.only(top: 14);
  const AppPadding.topXLarge() : super.only(top: 16);
  const AppPadding.topXXLarge() : super.only(top: 20);

  ///Only Bottom Padding
  const AppPadding.bottomXXSmall() : super.only(bottom: 2);
  const AppPadding.bottomXSmall() : super.only(bottom: 4);
  const AppPadding.bottomSmall() : super.only(bottom: 8);
  const AppPadding.bottomMedium() : super.only(bottom: 10);
  const AppPadding.bottomNormal() : super.only(bottom: 12);
  const AppPadding.bottomLarge() : super.only(bottom: 14);
  const AppPadding.bottomXLarge() : super.only(bottom: 16);
  const AppPadding.bottomXXLarge() : super.only(bottom: 20);
}
