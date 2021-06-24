import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);

Widget horizontalSpace(double width) => SizedBox(width: width);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);

Widget verticalSpace(double height) => SizedBox(height: height);

BorderRadiusGeometry roundedCorner(double radius) =>
    BorderRadius.circular(radius);

ShapeBorder roundedCornerShape(double radius) =>
    RoundedRectangleBorder(borderRadius: roundedCorner(radius));

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
