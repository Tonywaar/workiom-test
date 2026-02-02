import 'package:flutter/cupertino.dart';
import 'package:workiom/export.dart';

class AppTitle extends StatelessWidget {
  final String title, description;

  const AppTitle({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (Navigator.canPop(context)) ...[
          15.verticalSpace,
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(CupertinoIcons.back, color: TColors.primary, size: 30),
          ),
          50.verticalSpace,
        ] else ...[
          100.verticalSpace,
        ],
        Text(title.tr, style: Theme.of(context).textTheme.headlineLarge),
        5.verticalSpace,
        Text(description.tr, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}