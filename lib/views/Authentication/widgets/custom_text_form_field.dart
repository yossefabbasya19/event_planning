import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String txt;
  String? Function(String?)? validate;
  bool isPassword;
  IconData icon;
  final int? maxLineSelect;

  CustomTextFormField({
     this.validate,
    required this.txt,
    this.isPassword = false,
    required this.icon,  this.maxLineSelect
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        maxLines: widget.maxLineSelect,
        obscureText: isObscureText,
        validator: widget.validate,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon,color: Theme.of(context).iconTheme.color,),
          suffixIcon: IconButton(
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              isObscureText = !isObscureText;
              setState(() {});
            },
            icon:
                widget.isPassword
                    ? isObscureText
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off)
                    : SizedBox(),
          ),
          label: Text(widget.txt, style: Theme.of(context).textTheme.labelSmall),
        ),
      ),
    );
  }
}
