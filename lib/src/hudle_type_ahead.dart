import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hudle_core/hudle_core.dart';
import 'package:hudle_theme/hudle_theme.dart';

class HudleTypeAheadField<T> extends TypeAheadFormField<T> {
  HudleTypeAheadField({
    required String label,
    required SuggestionSelectionCallback onSuggestionSelected,
    required ItemBuilder itemBuilder,
    required SuggestionsCallback<T> suggestionsCallback,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    AutovalidateMode autovalidateMode: AutovalidateMode.disabled,
    int? maxLength,
    TextInputType keyboardType = TextInputType.none,
  }) : super(
          onSuggestionSelected: onSuggestionSelected,
          itemBuilder: itemBuilder,
          suggestionsCallback: suggestionsCallback,
          autovalidateMode: AutovalidateMode.always,
          textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            label: NormalText(label),
            counterText: "",
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelStyle: TextStyle(color: kColorEditTextHint),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kColorAccent, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kColorEditTextBorder, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kColorError, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kColorError, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kColorEditTextBorder, width: 1.0),
            ),
          ))
        );
}
