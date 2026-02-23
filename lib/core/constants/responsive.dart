import 'package:flutter/material.dart';

EdgeInsets responsivePadding(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 600) return const EdgeInsets.symmetric(horizontal: 16);
  if (width < 840) return const EdgeInsets.symmetric(horizontal: 24);
  return const EdgeInsets.symmetric(horizontal: 32);
}

bool isCompact(BuildContext context) => MediaQuery.sizeOf(context).width < 600;
