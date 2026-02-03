import 'package:workiom/app/modules/auth/models/authenticate_params.dart';
import 'package:workiom/app/modules/auth/models/password_complexity_data_model.dart';
import 'package:workiom/app/modules/auth/models/register_tenant_params.dart';
import 'package:workiom/export.dart';

import '../models/authenticate_data_model.dart';
import '../models/editions_data_model.dart';
import '../models/register_tenant_data_model.dart';
import '../models/tenant_available_data_model.dart';
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

  final loginFormKey = GlobalKey<FormState>();
  final workspaceFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController workspaceController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  Future<void> validateAndProceed() async {
    requestState(.loading);
    if (currentScreen.value == 0) {
      if (!loginFormKey.currentState!.validate()) {
        requestState(.error);
        return;
      }
      currentScreen.value = 1;
      requestState(.success);
    } else {
      if (!workspaceFormKey.currentState!.validate()) {
        workspaceNameError.value = "";
        requestState(.error);
        return;
      }

      await checkTenantName(workspaceController.text, showMessage: true);

      if (workspaceNameError.value != TStrings.workspaceAvailable.tr) {
        requestState(.error);
        return;
      }

      await register();
      requestState(.success);
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
    return countOfPassedRules.value == numberOfRules ? null : "";
  }

  //api calls

  Rx<RequestState> requestState = RequestState.begin.obs;
  Rx<RequestState> getRulesRequestState = RequestState.begin.obs;
  Rx<RequestState> checkNameRequestState = RequestState.begin.obs;

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
    } else {
      AppFunctions.showErrorDialog(
        title: TStrings.editionsError,
        description: result.error?.data?.toString() ?? TStrings.failedToLoadEditions.tr,
      );
    }
  }

  Future<void> getPasswordSettings() async {
    getRulesRequestState(.loading);
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

      getRulesRequestState(.success);
      refresh();
    } else {
      getRulesRequestState(.error);
      AppFunctions.showErrorDialog(
        title: TStrings.passwordSettingsError,
        description: result.error?.data?.toString() ?? TStrings.failedToLoadPasswordSettings.tr,
      );
    }
  }

  Rx<String> workspaceNameError = "".obs;

  Future<void> checkTenantName(String name, {bool showMessage = false}) async {
    workspaceNameError.value = AppFunctions.workspaceValidator(name) ?? "";

    if (workspaceNameError.value.isEmpty) {
      checkNameRequestState(.loading);
      var result = await _authRepo.postCheckTenantAvailability(name: name);
      if (result is DataSuccess<GeneralResponse<TenantAvailableData>>) {
        if (result.data?.result?.tenantId == null) {
          workspaceNameError.value = TStrings.workspaceAvailable.tr;
          checkNameRequestState(.success);
        } else {
          workspaceNameError.value = TStrings.workspaceTaken.tr;
          checkNameRequestState(.error);
          if (showMessage) {
            AppFunctions.showErrorDialog(
              title: TStrings.tenantAvailabilityError,
              description: TStrings.workspaceTaken.tr,
            );
          }
        }
      } else {
        checkNameRequestState(.error);
        AppFunctions.showErrorDialog(
          title: TStrings.tenantAvailabilityError,
          description:
              result.error?.data?.toString() ?? TStrings.failedToCheckTenantAvailability.tr,
        );
      }
    } else {
      if (workspaceNameError.value == TStrings.textRequired.tr) {
        workspaceNameError.value = "";
      }
      checkNameRequestState(.error);
    }
  }

  Future<void> register() async {
    RegisterTenantParams params = RegisterTenantParams(
      adminEmailAddress: emailController.text,
      adminFirstName: firstNameController.text,
      adminLastName: lastNameController.text,
      adminPassword: passwordController.text,
      editionId: selectedEditionId.toString(),
      name: workspaceController.text,
      tenancyName: workspaceController.text,
    );
    String timeZone = await AppFunctions.getIanaTimeZone();

    var result = await _authRepo.postRegisterTenant(params: params, timeZone: timeZone);

    if (result is DataSuccess<GeneralResponse<RegisterTenantData>>) {
      if (result.data?.result?.tenantId != null) {
        authenticate();
      }
    } else {
      requestState(.error);
      AppFunctions.showErrorDialog(
        title: TStrings.registrationError,
        description: result.error?.data?.toString() ?? TStrings.failedToRegisterTenant.tr,
      );
    }
  }

  Future<void> authenticate() async {
    String timeZone = await AppFunctions.getIanaTimeZone();
    AuthenticateParams params = AuthenticateParams(
      ianaTimeZone: timeZone,
      password: passwordController.text,
      userNameOrEmailAddress: emailController.text,
      tenantName: workspaceController.text,
      returnUrl: null,
      rememberClient: false,
      singleSignIn: false,
    );

    var result = await _authRepo.postAuthenticate(params: params);

    if (result is DataSuccess<GeneralResponse<AuthenticateData>>) {
      if (result.data?.result?.accessToken != null) {
        cache.write(CacheHelper.token, result.data?.result?.accessToken);

        bool loggedIn = await UserService.instance.getLoginInfo();

        if (loggedIn) {
          Get.offAllNamed(Routes.HOME);
        }
      }
    } else {
      requestState(.error);
      AppFunctions.showErrorDialog(
        title: TStrings.authenticationError,
        description: result.error?.data?.toString() ?? TStrings.failedToAuthenticate.tr,
      );
    }
  }
}