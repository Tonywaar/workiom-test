// adminEmailAddress: "EMAIL ADDRESS"
// adminFirstName: "FIRST NAME"
// adminLastName: "LAST NAME"
// adminPassword: "PASSWORD"
// captchaResponse: null
// editionId: "EDITION ID"
// name: "TENANT NAME"
// tenancyName: "TENANT NAME"

class RegisterTenantParams {
  String adminEmailAddress;
  String adminFirstName;
  String adminLastName;
  String adminPassword;
  String? captchaResponse;
  String editionId;
  String name;
  String tenancyName;

  RegisterTenantParams({
    required this.adminEmailAddress,
    required this.adminFirstName,
    required this.adminLastName,
    required this.adminPassword,
    this.captchaResponse,
    required this.editionId,
    required this.name,
    required this.tenancyName,
  });

  Map<String, dynamic> toJson() => {
    "adminEmailAddress": adminEmailAddress,
    "adminFirstName": adminFirstName,
    "adminLastName": adminLastName,
    "adminPassword": adminPassword,
    "captchaResponse": captchaResponse,
    "editionId": editionId,
    "name": name,
    "tenancyName": tenancyName,
  };
}