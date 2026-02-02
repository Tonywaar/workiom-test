import 'package:get_storage/get_storage.dart';
import 'package:workiom/export.dart';

import 'app/core/localization/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await initDependencies();

  SystemChrome.setPreferredOrientations([
    //
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,
  ]);

  runApp(const WorkiomApp());
}

class WorkiomApp extends StatelessWidget {
  const WorkiomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: "Workiom Test Application",
          debugShowCheckedModeBanner: false,
          //
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          //
          themeMode: ThemeMode.light,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.lightTheme,
          //
          translations: AppTranslations(),
          locale: Locale(cache.read(CacheHelper.language) ?? 'en'),
          fallbackLocale: const Locale('en'),
          //
          builder: (context, child) {
            AppFunctions.setStatusBarStyle();
            return child ?? const SizedBox.shrink();
          },
        );
      },
    );
  }
}