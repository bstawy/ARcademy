import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String labelText;
  final TextStyle? labelTextStyle;
  final String hintText;
  final TextStyle? hintTextStyle;
  final int maxLines;
  final FormFieldValidator<String>? validator;

  final Widget? suffixIcon;
  final bool obscureText;
  final double? minHeight;
  final double? maxHeight;
  final EdgeInsets? contentPadding;
  final double? borderRadius;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.labelTextStyle,
    required this.hintText,
    this.hintTextStyle,
    this.maxLines = 1,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.minHeight,
    this.maxHeight,
    this.contentPadding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: labelTextStyle ?? theme.textTheme.labelLarge,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          textAlign: TextAlign.start,
          cursorColor: theme.colorScheme.primary,
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.onSurface,
            constraints: BoxConstraints(
              minHeight: minHeight ?? 56.h,
              maxHeight: maxHeight ?? 70.h,
            ),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
            suffixIconColor: theme.colorScheme.secondary,
            hintStyle: hintTextStyle ??
                theme.textTheme.labelLarge!.copyWith(
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
