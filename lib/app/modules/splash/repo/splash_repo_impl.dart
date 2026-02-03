import 'package:workiom/export.dart';

import '../models/login_information_data_model.dart';
import 'splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  final DataService _dataService = injector();

  @override
  Future<DataState<GeneralResponse<LoginInformationData>>> getCurrentLoginInformation() {
    return _dataService.getData(
      endPoint: DataConsts.getCurrentLoginInformation,
      fromJson: (json) => LoginInformationData.fromJson(json),
    );
  }
}