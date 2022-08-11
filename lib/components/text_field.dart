import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intask/constants.dart';

class UnprotectedTextField extends StatefulWidget {
  UnprotectedTextField({required this.placeHolder});
  String placeHolder;
  @override
  State<UnprotectedTextField> createState() => _UnprotectedTextFieldState();
}

class _UnprotectedTextFieldState extends State<UnprotectedTextField> {

  String placeHolder = '';
  String submittedValue = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: EdgeInsets.all(16.0),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      placeholder: placeHolder,
      placeholderStyle: kTextFieldPlaceHolderTextSytle,
      style: kTextFieldTextStyle,
      decoration: BoxDecoration(
        color: CupertinoColors.systemFill,
        border: Border.all(
            width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      cursorColor: CupertinoColors.activeBlue,
      onChanged: (value) => setState(() => this.submittedValue),
      onSubmitted: (value) => print('Submitted $placeHolder: $value'),
    );
  }
}

