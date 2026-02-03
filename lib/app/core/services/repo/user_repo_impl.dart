import 'package:workiom/export.dart';

import '../../../data/models/login_information_data_model.dart';
import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  final DataService _dataService = injector();

  @override
  Future<DataState<GeneralResponse<LoginInformationData>>> getCurrentLoginInformation() {
    return _dataService.getData(
      endPoint: DataConsts.getCurrentLoginInformation,
      fromJson: (json) => LoginInformationData.fromJson(json),
    );
  }
}