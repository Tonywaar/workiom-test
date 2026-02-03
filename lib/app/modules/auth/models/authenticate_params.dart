// ianaTimeZone: "TIMEZONE"
// password: "PASSWORD"
// rememberClient: false
// returnUrl: null
// singleSignIn: false
// tenantName: "TENANT NAME"
// userNameOrEmailAddress: "EMAIL ADDRESS"

class AuthenticateParams {
  String ianaTimeZone;
  String password;
  bool rememberClient;
  String? returnUrl;
  bool singleSignIn;
  String tenantName;
  String userNameOrEmailAddress;

  AuthenticateParams({
    required this.ianaTimeZone,
    required this.password,
    required this.rememberClient,
    this.returnUrl,
    required this.singleSignIn,
    required this.tenantName,
    required this.userNameOrEmailAddress,
  });

  Map<String, dynamic> toJson() => {
    "ianaTimeZone": ianaTimeZone,
    "password": password,
    "rememberClient": rememberClient,
    "returnUrl": returnUrl,
    "singleSignIn": singleSignIn,
    "tenantName": tenantName,
    "userNameOrEmailAddress": userNameOrEmailAddress,
  };
}