import 'package:workiom/export.dart';

import '../controllers/auth_controller.dart';

class WorkspaceBody extends StatelessWidget {
  final AuthController controller;

  const WorkspaceBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextField(
          label: TStrings.yourCompanyName.tr,
          hint: "Workspace*",
          isLTR: true,
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Text(".workiom.com"),
          ),
          prefix: CustomSvg(Assets.icons.group),
          controller: controller.workspaceController,
          validator: AppFunctions.workspaceValidator,
          onFieldSubmitted: (value) => controller.checkTenantName(value),
          autoValidateMode: true,
          onChanged: (_) => controller.workspaceNameError.value = "",
          onTapOutside: () => controller.checkTenantName(controller.workspaceController.text),
        ),
        Obx(
          () => Row(
            children: [
              34.horizontalSpace,
              Text(
                controller.workspaceNameError.value,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      controller.checkNameRequestState.value.isError &&
                          !controller.checkNameRequestState.value.isLoading
                      ? TColors.redColor
                      : TColors.darkGreenColor,

                  fontSize: 12.sp,
                  height: 0,
                ),
              ),
            ],
          ).paddingOnly(top: 2),
        ),
        20.verticalSpace,
        LabeledTextField(
          label: TStrings.firstName.tr,
          hint: TStrings.enterFirstName.tr,
          prefix: CustomSvg(Assets.icons.name),
          controller: controller.firstNameController,
          validator: AppFunctions.nameValidator,
          keyboardType: .name,
        ),

        25.verticalSpace,
        LabeledTextField(
          label: TStrings.lastName.tr,
          hint: TStrings.enterLastName.tr,
          prefix: CustomSvg(Assets.icons.name),
          controller: controller.lastNameController,
          validator: AppFunctions.nameValidator,
          keyboardType: .name,
        ),
      ],
    );
  }
}