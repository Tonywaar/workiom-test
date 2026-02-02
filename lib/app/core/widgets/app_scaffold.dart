import 'package:workiom/export.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body).paddingSymmetric(horizontal: 15),

      bottomNavigationBar:
          Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                children: [
                  Text(TStrings.stayOrganizedWith.tr, style: Theme.of(context).textTheme.bodyLarge),
                  5.horizontalSpace,
                  CustomSvg(Assets.icons.logo),
                ],
              ) //
              .paddingSymmetric(horizontal: 25.w)
              .paddingOnly(bottom: MediaQuery.of(context).viewPadding.bottom + 25.h),
    );
  }
}