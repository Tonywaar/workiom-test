import 'package:workiom/export.dart';

import '../models/login_info_model.dart';

abstract class SplashRepo {
  Future<DataState<GeneralResponse<LoginInfoModel>>> getCurrentLoginInformation();
}