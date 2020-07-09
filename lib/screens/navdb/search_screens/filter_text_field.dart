import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilterTextField extends StatelessWidget {
  final String hintMessage;
  final String labelText;
  final Icon icon;
  final bool isNumber;
  final TextEditingController controller ;
  final double width;
  final double height;

  FilterTextField({this.labelText, this.hintMessage, this.icon, this.isNumber,this.controller, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        maxLines: 1,
        onChanged: (value){
        },
        controller: controller,
        inputFormatters: checkType(isNumber),
        style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: icon,
          contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 1.0),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(2.0),
            ),
          ),
          hintText: hintMessage,
          /*hintStyle: TextStyle(fontSize: 18.0, color: Colors.green),
          labelStyle: TextStyle(fontSize: 18.0, color: Colors.red),*/
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
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
