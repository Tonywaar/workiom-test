import 'package:workiom/app/modules/auth/models/password_complexity_data_model.dart';
import 'package:workiom/export.dart';

import '../models/editions_data_model.dart';
import '../repo/auth_repo.dart';
import '../repo/auth_repo_impl.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = AuthRepoImpl();

  @override
  void onInit() {
    //
    getEditions();
    getPasswordSettings();
    super.onInit();
  }

  RxInt currentScreen = 0.obs;

  List<String> screenTitles = [TStrings.loginTitle, TStrings.companyTitle];
  List<String> buttonTitles = [TStrings.confirmPassword, TStrings.createWorkSpace];

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController workspaceController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void validateAndProceed() {
    if (!formKey.currentState!.validate()) return;
    if (currentScreen.value == 0) {
      currentScreen.value = 1;
    } else {
      currentScreen.value = 0;
    }
  }

  //api calls

  Rx<RequestState> requestState = RequestState.begin.obs;

  int selectedEditionId = 0;

  late Setting passwordSettings;
  RxBool isPasswordValid = false.obs;
  int numberOfRules = 5;
  RxInt countOfPassedRules = 0.obs;

  Future<void> getEditions() async {
    var result = await _authRepo.getEditionsForSelect();
    if (result is DataSuccess<GeneralResponse<EditionsData>>) {
      var firstEdition = result.data?.result?.editionsWithFeatures?.firstWhere(
        (element) => element.edition?.isRegistrable == true,
      );
      if (firstEdition != null) {
        selectedEditionId = firstEdition.edition?.id ?? 0;
      }
    }
  }

  Future<void> getPasswordSettings() async {
    requestState(.loading);
    var result = await _authRepo.getPasswordComplexitySetting();
    if (result is DataSuccess<GeneralResponse<PasswordComplexityData>>) {
      passwordSettings = result.data!.result!.setting!;
      numberOfRules = 1;
      if (passwordSettings.requireDigit ?? false) {
        numberOfRules++;
        passwordSettings.requireDigitPassed.value = false;
      }
      if (passwordSettings.requireLowercase ?? false) numberOfRules++;
      if (passwordSettings.requireNonAlphanumeric ?? false) numberOfRules++;
      if (passwordSettings.requireUppercase ?? false) numberOfRules++;

      requestState(.success);
      refresh();
    } else {
      requestState(.error);
    }
  }
}