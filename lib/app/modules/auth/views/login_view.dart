import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workiom/app/core/widgets/app_title.dart';

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
              child: Column(crossAxisAlignment: .start, children: []),
            ),
          ),
        ],
      ),
    );
  }
}