import 'package:app_merchant_saler/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  final TextFieldBloc<dynamic> textFieldBloc;
  final String labelText, hintText;
  final TextInputAction? textInputAction;
  bool? obscureText;
  final int? maxLines;
  final bool? password;
  final bool? expands;
  final TextInputType? keyboardType;
  CustomTextfield({
    super.key,
    required this.textFieldBloc,
    required this.labelText,
    required this.hintText,
    this.textInputAction,
    this.obscureText = true,
    this.maxLines = 1,
    this.expands = false,
    this.keyboardType,
    this.password = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      textFieldBloc: widget.textFieldBloc,
      textInputAction: widget.textInputAction,
      obscureText: widget.password == true ? widget.obscureText : false,
      maxLines: widget.maxLines,
      expands: widget.expands!,
      keyboardType: widget.keyboardType,
      decoration: widget.password == false
          ? InputDecoration(
              filled: true,
              fillColor: kWhiteColor,
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: kBlack, fontSize: 12),
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: kGrey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            )
          : InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  widget.obscureText! ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText!;
                  });
                },
              ),
              filled: true,
              fillColor: kWhiteColor,
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: kBlack, fontSize: 12),
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: kGrey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
    );
  }
}
