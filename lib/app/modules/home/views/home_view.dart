import 'package:workiom/export.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: () {
                  UserService.instance.clearUserData();
                  Get.offAllNamed(Routes.SPLASH);
                },
                icon: Icon(Icons.logout, color: TColors.redColor),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineLarge,

                  children: [
                    TextSpan(text: TStrings.homeTitle.tr),

                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: SvgPicture.asset(Assets.icons.icon, width: 18, height: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}