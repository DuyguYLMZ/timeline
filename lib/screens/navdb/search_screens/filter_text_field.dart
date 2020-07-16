import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilterTextField extends StatelessWidget {
  final String hintMessage;
  final String labelText;
  final bool isNumber;
  final TextEditingController controller ;
  final double width;
  final double height;
  final Icon icon;

  FilterTextField({this.labelText, this.hintMessage, this.isNumber,this.controller, this.width, this.height, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        inputFormatters: checkType(isNumber),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey,),
          contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 1.0),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(2.0),
            ),
          ),
          hintText: hintMessage,
          labelStyle: new TextStyle(fontWeight: FontWeight.normal, color: Colors.grey,),
          labelText: labelText,
          filled: false,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }

  checkType(bool textType) {
    if (isNumber) {
      return [WhitelistingTextInputFormatter.digitsOnly];
    }
  }
}
