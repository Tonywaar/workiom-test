import 'package:workiom/export.dart';

import '../models/login_info_model.dart';
import 'splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  final DataService _dataService = injector();

  @override
  Future<DataState<GeneralResponse<LoginInfoModel>>> getCurrentLoginInformation() {
    return _dataService.getData(
      endPoint: DataConsts.getCurrentLoginInformation,
      fromJson: (json) => LoginInfoModel.fromJson(json),
    );
  }
}