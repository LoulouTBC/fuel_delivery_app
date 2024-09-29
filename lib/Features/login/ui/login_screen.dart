import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/already_have_account.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/email_and_password.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:fuel_delivery_app/core/helpers/spacing.dart';
import 'package:fuel_delivery_app/core/widgets/app_text_button.dart';
import 'package:fuel_delivery_app/core/widgets/app_text_form_field.dart';

import '../../../core/theming/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font32BlueBold,
                ),
                SizedBox(
                  height: 8.verticalSpace.height,
                ),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(100),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpace(10),
                      AppTextFormField(
                        hintText: 'Password',
                        isObsecureText: isObsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObsecureText = !isObsecureText;
                            });
                          },
                          child: Icon(isObsecureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(
                          buttonText: 'Login',
                          textStyle: TextStyles.font18WhiteMedium,
                          onPressed: () {}),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
