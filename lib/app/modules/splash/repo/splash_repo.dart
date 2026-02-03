import 'package:workiom/export.dart';

import '../models/login_information_data_model.dart';

abstract class SplashRepo {
  Future<DataState<GeneralResponse<LoginInformationData>>> getCurrentLoginInformation();
}