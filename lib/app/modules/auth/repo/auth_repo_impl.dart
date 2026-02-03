import 'package:workiom/export.dart';

import '../models/authenticate_data_model.dart';
import '../models/authenticate_params.dart';
import '../models/editions_data_model.dart';
import '../models/password_complexity_data_model.dart';
import '../models/register_tenant_data_model.dart';
import '../models/register_tenant_params.dart';
import '../models/tenant_available_data_model.dart';
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

  @override
  Future<DataState<GeneralResponse<TenantAvailableData>>> postCheckTenantAvailability({
    required String name,
  }) {
    return _dataService.postData(
      endPoint: DataConsts.postTenantAvailable,
      fromJson: (json) => TenantAvailableData.fromJson(json),
      data: {"tenancyName": name},
    );
  }

  @override
  Future<DataState<GeneralResponse<RegisterTenantData>>> postRegisterTenant({
    required RegisterTenantParams params,
    required String timeZone,
  }) async {
    return _dataService.postData(
      endPoint: "${DataConsts.postRegisterTenant}?timeZone=$timeZone",

      fromJson: (json) => RegisterTenantData.fromJson(json),
      data: params.toJson(),
    );
  }

  @override
  Future<DataState<GeneralResponse<AuthenticateData>>> postAuthenticate({
    required AuthenticateParams params,
  }) {
    return _dataService.postData(
      endPoint: DataConsts.postAuthenticate,

      fromJson: (json) => AuthenticateData.fromJson(json),
      data: params.toJson(),
    );
  }
}