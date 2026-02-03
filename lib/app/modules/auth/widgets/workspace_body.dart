import 'package:flutter/cupertino.dart';
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
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Text(".workiom.com"),
          ),
          prefix: CustomSvg(Assets.icons.group),
          controller: controller.workspaceController,
          validator: AppFunctions.requiredValidator,
        ),
        25.verticalSpace,
        LabeledTextField(
          label: TStrings.firstName.tr,
          hint: TStrings.enterFirstName.tr,
          prefix: CustomSvg(Assets.icons.name),
          controller: controller.firstNameController,
          validator: AppFunctions.requiredValidator,
        ),

        25.verticalSpace,
        LabeledTextField(
          label: TStrings.lastName.tr,
          hint: TStrings.enterLastName.tr,
          prefix: CustomSvg(Assets.icons.name),
          controller: controller.lastNameController,
          validator: AppFunctions.requiredValidator,
        ),
      ],
    );
  }
}