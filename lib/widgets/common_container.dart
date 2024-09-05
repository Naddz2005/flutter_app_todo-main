import 'package:flutter/material.dart';
import 'package:flutter_app_todo/utils/extensions.dart';

class CommonComtainer extends StatelessWidget {
  const CommonComtainer({super.key, this.child, this.height});
  final Widget? child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return Container(
      height: height,
      width: deviceSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.colorScheme.primaryContainer),
      child: child,
    );
  }
}
