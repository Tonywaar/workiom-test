import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workiom/export.dart';

final injector = GetIt.asNewInstance();

Future<void> initDependencies() async {
  final dio = Dio(
    BaseOptions(
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      error: true,
      requestHeader: true,
      logPrint: (object) => AppFunctions.print(object),
    ),
  );

  injector.registerSingleton<Dio>(dio);

  injector.registerSingleton<DataService>(DataService(injector()));

  Get.put(UserService(), permanent: true);
}