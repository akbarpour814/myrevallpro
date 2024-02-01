import 'package:flutter/material.dart';

class CustomDropDown<Type> extends StatelessWidget {
  CustomDropDown(
      {super.key,
      required this.lable,
      this.hint,
      this.errorText,
      this.focusColor,
      this.dropdownSelectedValue,
      this.dropdownItemList,
      this.onChanged,
      this.validator,
      this.crossAxisAlignment,
      this.isBold,
      this.icon,
      this.prefixIcon,
      this.autovalidateMode,
      this.contentPadding});
  final String lable;
  final String? hint;
  final String? errorText;
  final Color? focusColor;
  final Type? dropdownSelectedValue;
  final List<DropdownMenuItem<Type>>? dropdownItemList;
  final ValueChanged? onChanged;
  final String? Function(Type?)? validator;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? isBold;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? icon;
  final Widget? prefixIcon;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: onChanged == null,
      child: DropdownButtonHideUnderline(
          child: ButtonTheme(
        child: DropdownButtonFormField<Type>(
          focusColor: focusColor,
          hint: Text(
            this.hint ?? '',
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minWidth: 30),
              prefixIcon: prefixIcon,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 10)),
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          value: dropdownSelectedValue,
          items: dropdownItemList,
          onChanged: onChanged,
          isExpanded: true,
          icon: icon,
          validator: validator,
        ),
      )),
    );
  }
}
