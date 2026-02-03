import 'package:workiom/export.dart';

class PasswordConditionItem extends StatelessWidget {
  const PasswordConditionItem({
    super.key,
    required this.context,
    required this.title,
    required this.passed,
  });

  final BuildContext context;
  final String title;
  final RxBool passed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      children: [
        Obx(() {
          return CustomSvg(passed.value ? Assets.icons.right : Assets.icons.wrong);
        }),
        5.horizontalSpace,
        Expanded(
          child: Text(
            "${TStrings.passwordMustHave.tr} $title",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}