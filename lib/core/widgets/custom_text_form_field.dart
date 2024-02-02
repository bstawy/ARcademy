import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String labelText;
  final String title;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.title,
    this.validator,
    this.maxLines = 1,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          textAlign: TextAlign.start,
          cursorColor: theme.colorScheme.primary,
          controller: textEditingController,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.onBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
            suffixIconColor: theme.colorScheme.secondary,
            hintText: title,
            hintStyle: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
