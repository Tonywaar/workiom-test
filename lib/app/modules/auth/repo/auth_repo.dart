import 'package:workiom/export.dart';

import '../models/editions_data_model.dart';
import '../models/password_complexity_data_model.dart';

abstract class AuthRepo {
  Future<DataState<GeneralResponse<EditionsData>>> getEditionsForSelect();

  Future<DataState<GeneralResponse<PasswordComplexityData>>> getPasswordComplexitySetting();
}