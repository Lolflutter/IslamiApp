import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class HadithScreen extends StatelessWidget {
  static const String routeName = 'HadithScreen';

  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(color: AppColors.coffee),
    );;
  }
}
