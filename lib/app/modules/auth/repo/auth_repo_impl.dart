import 'package:workiom/export.dart';

import '../models/editions_data_model.dart';
import '../models/password_complexity_data_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final DataService _dataService = injector();

  @override
  Future<DataState<GeneralResponse<EditionsData>>> getEditionsForSelect() {
    return _dataService.getData(
      endPoint: DataConsts.getEditionsForSelect,
      fromJson: (json) => EditionsData.fromJson(json),
    );
  }

  @override
  Future<DataState<GeneralResponse<PasswordComplexityData>>> getPasswordComplexitySetting() {
    return _dataService.getData(
      endPoint: DataConsts.getPasswordComplexitySetting,
      fromJson: (json) => PasswordComplexityData.fromJson(json),
    );
  }
}