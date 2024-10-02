// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fuel_delivery_app/Features/login/ui/widgets/terms_and_conditions_text.dart';
// import 'package:fuel_delivery_app/Features/signup/ui/widgets/already_have_account.dart';
// import 'package:fuel_delivery_app/core/theming/styles.dart';
// import 'package:fuel_delivery_app/core/widgets/app_text_button.dart';
// import 'package:fuel_delivery_app/core/widgets/app_text_form_field.dart';

// import '../../../core/helpers/spacing.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUPScreenState();
// }

// class _SignUPScreenState extends State<SignUpScreen> {
//   final formkey = GlobalKey<FormState>();
//   bool isObsecureText = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Create Account',
//                   style: TextStyles.font24BlueBold,
//                 ),
//                 verticalSpace(8),
//                 Text(
//                   'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
//                   style: TextStyles.font14GrayRegular,
//                 ),
//                 verticalSpace(50),
//                 Form(
//                   key: formkey,
//                   child: Column(
//                     children: [
//                       AppTextFormField(hintText: 'Name'),
//                       verticalSpace(10),
//                       AppTextFormField(hintText: 'Phone Number'),
//                       verticalSpace(10),
//                       AppTextFormField(hintText: 'Email'),
//                       verticalSpace(10),
//                       AppTextFormField(
//                         hintText: 'Password',
//                         isObsecureText: isObsecureText,
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isObsecureText = !isObsecureText;
//                             });
//                           },
//                           child: Icon(isObsecureText
//                               ? Icons.visibility_off
//                               : Icons.visibility),
//                         ),
//                       ),
//                       verticalSpace(24),
//                       Align(
//                         alignment: AlignmentDirectional.centerEnd,
//                         child: Text(
//                           'Forgot Password?',
//                           style: TextStyles.font13BlueRegular,
//                         ),
//                       ),
//                       verticalSpace(40),
//                       AppTextButton(
//                           buttonText: 'Register',
//                           textStyle: TextStyles.font18WhiteMedium,
//                           onPressed: () {}),
//                       verticalSpace(16),
//                       const TermsAndConditionsText(),
//                       verticalSpace(60),
//                       const AlreadyHaveAccount(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
