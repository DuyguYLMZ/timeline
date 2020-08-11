import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablet_app/values/theme.dart';

const inputTextStyle = TextStyle(fontSize: 40);

class MaskTextInputFormatter extends TextInputFormatter {
  String mask;
  var maskArray;

  MaskTextInputFormatter({String mask}) {
    this.mask = mask;
    maskArray = mask.split("");
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final selectionBefore = oldValue.selection;

    final String textBefore = oldValue.text;
    final String textAfter = newValue.text;

    final startBefore = selectionBefore.start == -1
        ? 0
        : selectionBefore.start; // imlecin bulunduğu yer
    final countBefore = selectionBefore.start == -1 ||
            selectionBefore.end == -1 // kaç karakter seçili olduğu
        ? 0
        : selectionBefore.end - selectionBefore.start;

    final after = textAfter.length - (textBefore.length - countBefore);
    final removed = after < 0 ? after.abs() : 0;

    final startAfter = max(0, startBefore + (after < 0 ? after : 0));
    final endAfter = max(0, startAfter + (after > 0 ? after : 0));

    var beforeTextArray = textBefore.split("");

    if (countBefore <= 0) {
      if (removed <= 0) {
        // Tek karakter eklendi
        var addedTextArray =
            textAfter.substring(startAfter, endAfter).split("");
        int charToAddIndex = 0;
        int offset = startBefore;
        if (offset < mask.length) {
          for (var i = startAfter;
              charToAddIndex < addedTextArray.length;
              i++) {
            if (maskArray[i] == '-') {
              beforeTextArray[i] = addedTextArray[charToAddIndex];
            }
            charToAddIndex++;
            offset++;
            for (var j = i + 1;
                j < maskArray.length && maskArray[j] != '-';
                j++) {
              offset++;
            }
          }
        }
        newValue = TextEditingValue(
            text: beforeTextArray.join(""),
            selection: TextSelection(baseOffset: offset, extentOffset: offset));
      } else {
        // Tek karakter silindi
        for (var i = startBefore; i > startAfter; i--) {
          beforeTextArray[i - 1] = maskArray[i - 1];
        }
        newValue = TextEditingValue(
            text: beforeTextArray.join(""), selection: newValue.selection);
      }
    } else {
      var addedTextArray = textAfter.substring(startAfter, endAfter).split("");

      var charToAddIndex = 0;
      var offset = startBefore;

      var replacedCharCount = 0;
      var i = startAfter;
      for (i = startAfter;
          offset < mask.length && charToAddIndex < addedTextArray.length;
          i++) {
        if (maskArray[i] == '-') {
          beforeTextArray[i] = addedTextArray[charToAddIndex];
        }
        offset++;
        charToAddIndex++;
        replacedCharCount++;
      }
      if (addedTextArray.length < countBefore) {
        while (replacedCharCount < countBefore) {
          beforeTextArray[i] = mask[i];
          i++;
          replacedCharCount++;
          offset++;
        }
      }

      newValue = TextEditingValue(
          text: beforeTextArray.join(""),
          selection: TextSelection(baseOffset: offset, extentOffset: offset));
    }

    return newValue;
  }
}

class CoordinateInput extends StatefulWidget {
  final _mask;
  final Function _onChanged;

  CoordinateInput(this._mask, {Function onChanged}) : _onChanged = onChanged;

  @override
  State<CoordinateInput> createState() {
    return CoordinateInputState();
  }
}

class CoordinateInputState extends State<CoordinateInput> {
  var _textEditingController = TextEditingController();

  @override
  void didUpdateWidget(CoordinateInput oldWidget) {
    setState(() {
      if (_hasFocus) {
        int firstEmptyPos = widget._mask.indexOf('-');
        setState(() {
          _textEditingController.value = TextEditingValue(
              text: widget._mask,
              selection: TextSelection(
                  baseOffset: firstEmptyPos, extentOffset: firstEmptyPos));
        });
      } else {
        _textEditingController.text = "";
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      width: double.infinity,
      height: 80,
      child: Focus(
        onFocusChange: (focus) {
          if (focus) {
            _hasFocus = true;
            var text = _textEditingController.text;
            if (_textEditingController.value.text.length == 0) {
              text = widget._mask;
            }
            int firstEmptyPos = text.indexOf('-');
            if (firstEmptyPos == -1) {
              firstEmptyPos = text.length;
            }
            setState(() {
              _textEditingController.value = TextEditingValue(
                  text: text,
                  selection: TextSelection(
                      baseOffset: firstEmptyPos, extentOffset: firstEmptyPos));
            });
          } else {
            _hasFocus = false;
            setState(() {
              if (_textEditingController.value.text.compareTo(widget._mask) ==
                  0) {
                _textEditingController.value = TextEditingValue(text: "");
              }
            });
          }
        },
        child: TextField(
          controller: _textEditingController,
          inputFormatters: [MaskTextInputFormatter(mask: widget._mask)],
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 20, color: black),
          decoration: InputDecoration(
            hintText: "Koordinat girişi",
            fillColor: Colors.white,
            filled: true,
          ),
          onChanged: (newVal) {
            widget._onChanged(newVal);
          },
        ),
      ),
    );
  }
}
