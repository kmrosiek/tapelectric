import 'package:flutter/material.dart';
import 'package:weathet_app/common/constants/app_colors.dart';

class SnackBarHelper {
  static show(BuildContext context, String text,
      {Color color = AppColors.primaryColor}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        elevation: 3,
        content: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
