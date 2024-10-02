import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuel_delivery_app/Features/login/data/model/login_request_body.dart';
import 'package:fuel_delivery_app/Features/login/logic/cubit/login_cubit.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/don\'t_have_account.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/email_and_password.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/login_bloc_listener.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:fuel_delivery_app/core/helpers/spacing.dart';
import 'package:fuel_delivery_app/core/widgets/app_text_button.dart';

import '../../../core/theming/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // final formkey = GlobalKey<FormState>();
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
                Column(
                  children: [
                    EmailAndPassword(),
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
                        onPressed: () {
                          validateThenDoLogin(context);
                        }),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formkey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text));
    }
  }
}
