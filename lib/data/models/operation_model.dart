import 'package:flutter/material.dart';

class OperationModel {
  const OperationModel({
    required this.id,
    required this.title,
    required this.icon,
    this.route,
  });

  final String id;
  final String title;
  final IconData icon;
  final String? route;
}
