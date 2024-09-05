import 'package:flutter/material.dart';
import 'package:flutter_app_todo/utils/extensions.dart';
import 'package:gap/gap.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
  });
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        const Gap(10),
        TextField(
          readOnly: readOnly,
          maxLines: maxLines,
          controller: controller,
          //Khi bấm ra ngoài TextField thì lập tức bỏ bàn phím
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          onChanged: (value) {},
        )
      ],
    );
  }
}
