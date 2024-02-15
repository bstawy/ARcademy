import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBodyHeaderWidget extends StatelessWidget {
  const HomeBodyHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 256.w,
              maxWidth: 300.w,
            ),
            child: Text(
              "See Beyond The Text Books",
              maxLines: 2,
              textAlign: TextAlign.left,
              style: theme.textTheme.displayMedium,
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            "Recently added",
            style: theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
