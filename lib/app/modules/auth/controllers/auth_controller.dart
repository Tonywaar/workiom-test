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

  String? validatePassword(String? password) {
    String? validationMessage = AppFunctions.requiredValidator(password);
    if (validationMessage == null) {
      return validateToRules(password!);
    }
    return validationMessage;
  }

  String? validateToRules(String password) {
    passwordSettings.resetPassedVars();
    countOfPassedRules(0);
    if (password.length >= (passwordSettings.requiredLength)) {
      countOfPassedRules.value++;
      passwordSettings.requiredLengthPassed.value = true;
    }

    if (passwordSettings.requireDigit) {
      if (password.contains(RegExp(r'[0-9]'))) {
        countOfPassedRules.value++;
        passwordSettings.requireDigitPassed.value = true;
      }
    }

    if (passwordSettings.requireLowercase) {
      if (password.contains(RegExp(r'[a-z]'))) {
        countOfPassedRules.value++;
        passwordSettings.requireLowercasePassed.value = true;
      }
    }

    if (passwordSettings.requireUppercase) {
      if (password.contains(RegExp(r'[A-Z]'))) {
        countOfPassedRules.value++;
        passwordSettings.requireUppercasePassed.value = true;
      }
    }

    if (passwordSettings.requireNonAlphanumeric) {
      if (password.contains(RegExp(r'[^a-zA-Z0-9]'))) {
        countOfPassedRules.value++;
        passwordSettings.requireNonAlphanumericPassed.value = true;
      }
    }
    print(countOfPassedRules.value == numberOfRules ? null : "");
    return countOfPassedRules.value == numberOfRules ? null : "";
  }

  //api calls

  Rx<RequestState> requestState = RequestState.begin.obs;

  int selectedEditionId = 0;

  late Setting passwordSettings;
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

      passwordSettings.resetPassedVars();
      if (passwordSettings.requireDigit) {
        numberOfRules++;
        passwordSettings.requireDigitPassed.value = false;
      }
      if (passwordSettings.requireLowercase) numberOfRules++;
      if (passwordSettings.requireNonAlphanumeric) numberOfRules++;
      if (passwordSettings.requireUppercase) numberOfRules++;

      requestState(.success);
      refresh();
    } else {
      requestState(.error);
    }
  }
}