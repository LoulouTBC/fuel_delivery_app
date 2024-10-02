import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app/Features/login/logic/cubit/login_cubit.dart';
import 'package:fuel_delivery_app/Features/login/ui/widgets/password_validation.dart';
import 'package:fuel_delivery_app/core/helpers/app_regex.dart';
import 'package:fuel_delivery_app/core/helpers/spacing.dart';
import 'package:fuel_delivery_app/core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecureText = true;
  late TextEditingController passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formkey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please Enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            isObsecureText: isObsecureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecureText = !isObsecureText;
                });
              },
              child: Icon(
                  isObsecureText ? Icons.visibility_off : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasMinLength: hasMinLength,
            hasNumber: hasNumber,
            hasSpecialCharacters: hasSpecialCharacters,
            hasUpperCase: hasUpperCase,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
// class EmailAndPassword extends StatefulWidget {
//   const EmailAndPassword({super.key});

//   @override
//   State<EmailAndPassword> createState() => _EmailAndPasswordState();
// }

// class _EmailAndPasswordState extends State<EmailAndPassword> {
//   bool isObscureText = true;
//   bool hasLowercase = false;
//   bool hasUppercase = false;
//   bool hasSpecialCharacters = false;
//   bool hasNumber = false;
//   bool hasMinLength = false;

//   late TextEditingController passwordController;

//   @override
//   void initState() {
//     super.initState();
//     passwordController = context.read<LoginCubit>().passwordController;
//     setupPasswordControllerListener();
//   }

//   void setupPasswordControllerListener() {
//     passwordController.addListener(() {
//       setState(() {
//         hasLowercase = AppRegex.hasLowerCase(passwordController.text);
//         hasUppercase = AppRegex.hasUpperCase(passwordController.text);
//         hasSpecialCharacters =
//             AppRegex.hasSpecialCharacter(passwordController.text);
//         hasNumber = AppRegex.hasNumber(passwordController.text);
//         hasMinLength = AppRegex.hasMinLength(passwordController.text);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: context.read<LoginCubit>().formKey,
//       child: Column(
//         children: [
//           AppTextFormField(
//             hintText: 'Email',
//             validator: (value) {
//               if (value == null ||
//                   value.isEmpty ||
//                   !AppRegex.isEmailValid(value)) {
//                 return 'Please enter a valid email';
//               }
//             },
//             controller: context.read<LoginCubit>().emailController,
//           ),
//           verticalSpace(18),
//           AppTextFormField(
//             controller: context.read<LoginCubit>().passwordController,
//             hintText: 'Password',
//             isObscureText: isObscureText,
//             suffixIcon: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   isObscureText = !isObscureText;
//                 });
//               },
//               child: Icon(
//                 isObscureText ? Icons.visibility_off : Icons.visibility,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter a valid password';
//               }
//             },
//           ),
//           verticalSpace(24),
//           PasswordValidations(
//             hasLowerCase: hasLowercase,
//             hasUpperCase: hasUppercase,
//             hasSpecialCharacters: hasSpecialCharacters,
//             hasNumber: hasNumber,
//             hasMinLength: hasMinLength,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     passwordController.dispose();
//     super.dispose();
//   }
// }
