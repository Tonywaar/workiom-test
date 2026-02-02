import 'package:workiom/export.dart';

import '../controllers/company_controller.dart';

class CompanyView extends GetView<CompanyController> {
  const CompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          AppTitle(title: TStrings.companyTitle, description: TStrings.screenTitleDesc),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  75.verticalSpace,

                  LabeledTextField(
                    label: TStrings.yourCompanyName.tr,
                    hint: "Workspace*",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Text(".workiom.com"),
                    ),
                    prefix: CustomSvg(Assets.icons.group),
                    controller: controller.workspaceController,
                  ),
                  25.verticalSpace,
                  LabeledTextField(
                    label: TStrings.firstName.tr,
                    hint: TStrings.enterFirstName.tr,
                    prefix: CustomSvg(Assets.icons.name),
                    controller: controller.firstNameController,
                  ),

                  25.verticalSpace,
                  LabeledTextField(
                    label: TStrings.lastName.tr,
                    hint: TStrings.enterLastName.tr,
                    prefix: CustomSvg(Assets.icons.name),
                    controller: controller.lastNameController,
                  ),

                  25.verticalSpace,
                  CustomButton(
                    color: TColors.greyColor,
                    withEnter: true,
                    title: TStrings.createWorkSpace.tr,
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}