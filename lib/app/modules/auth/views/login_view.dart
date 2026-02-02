import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workiom/app/core/widgets/app_title.dart';
import 'package:workiom/app/core/widgets/labeled_text_field.dart';

import 'package:workiom/export.dart';

class LoginView extends GetView {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: .start,
        children: [
          AppTitle(title: TStrings.loginTitle, description: TStrings.screenTitleDesc),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  75.verticalSpace,

                  LabeledTextField(
                    label: TStrings.yourWorkEmail.tr,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(CupertinoIcons.clear_circled),
                    ),
                    prefix: CustomSvg(Assets.icons.message),
                    controller: TextEditingController(),
                  ),
                  25.verticalSpace,
                  LabeledTextField(
                    label: TStrings.yourPassword.tr,

                    isPassword: true,
                    prefix: CustomSvg(Assets.icons.lock),
                    controller: TextEditingController(),
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