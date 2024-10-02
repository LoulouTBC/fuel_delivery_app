import 'package:flutter/material.dart';
import 'package:fuel_delivery_app/core/helpers/spacing.dart';
import 'package:fuel_delivery_app/core/theming/colors.dart';
import 'package:fuel_delivery_app/core/theming/styles.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialCharacters;
  final bool hasMinLength;

  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialCharacters,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidatinRow('At least 1 lowercase', hasLowerCase),
        verticalSpace(2),
        buildValidatinRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidatinRow('At least 1 special charecter', hasSpecialCharacters),
        verticalSpace(2),
        buildValidatinRow('At least 1 number', hasNumber),
        verticalSpace(2),
        buildValidatinRow('At least 8 charecters long', hasMinLength),
      ],
    );
  }

  Widget buildValidatinRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.darkBlue,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13BlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? Colors.grey : ColorsManager.darkBlue),
        ),
      ],
    );
  }
}
