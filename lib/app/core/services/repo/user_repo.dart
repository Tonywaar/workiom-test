import 'package:workiom/export.dart';

import '../../../data/models/login_information_data_model.dart';

abstract class UserRepo {
  Future<DataState<GeneralResponse<LoginInformationData>>> getCurrentLoginInformation();
}