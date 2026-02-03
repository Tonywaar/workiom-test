import 'package:workiom/export.dart';

import '../models/authenticate_data_model.dart';
import '../models/authenticate_params.dart';
import '../models/editions_data_model.dart';
import '../models/password_complexity_data_model.dart';
import '../models/register_tenant_data_model.dart';
import '../models/register_tenant_params.dart';
import '../models/tenant_available_data_model.dart';

abstract class AuthRepo {
  Future<DataState<GeneralResponse<EditionsData>>> getEditionsForSelect();

  Future<DataState<GeneralResponse<PasswordComplexityData>>> getPasswordComplexitySetting();

  Future<DataState<GeneralResponse<TenantAvailableData>>> postCheckTenantAvailability({
    required String name,
  });

  Future<DataState<GeneralResponse<RegisterTenantData>>> postRegisterTenant({
    required RegisterTenantParams params,
    required String timeZone,
  });

  Future<DataState<GeneralResponse<AuthenticateData>>> postAuthenticate({
    required AuthenticateParams params,
  });
}