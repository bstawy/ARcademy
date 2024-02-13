import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_back_button.dart';
import '../../../layout/layout_view_model.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CustomBackButton(onClicked: () {
          Provider.of<LayoutViewModel>(context, listen: false)
              .changeCurrentScreen(context, 0);
        }),
        SizedBox(width: 85.w),
        Text(
          "Profile",
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}