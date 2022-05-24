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
    WidgetBuilder? noItemsFoundBuilder,
    ErrorBuilder? errorBuilder,
    WidgetBuilder? loaderBuilder,
    AutovalidateMode autovalidateMode: AutovalidateMode.disabled,
    int? maxLength,
    InputDecoration? decoration,
    AnimationTransitionBuilder? transitionBuilder,
    Duration animationDuration: const Duration(milliseconds: 500),
    double animationStart: 0.25,
    AxisDirection direction: AxisDirection.down,
    bool hideOnLoading: false,
    bool hideOnEmpty: false,
    bool hideOnError: false,
    bool hideSuggestionsOnKeyboardHide: true,
    bool keepSuggestionsOnLoading: true,
    bool keepSuggestionsOnSuggestionSelected: false,
    bool autoFlipDirection: false,
    bool hideKeyboard: false,
    Widget? prefix,
    Widget? suffix,
    Widget? prefixIcon,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    TextInputType keyboardType = TextInputType.none,
  }) : super(
      onSuggestionSelected: onSuggestionSelected,
      itemBuilder: itemBuilder,
      suggestionsCallback: suggestionsCallback,
      autovalidateMode: AutovalidateMode.always,
      noItemsFoundBuilder: noItemsFoundBuilder,
      errorBuilder: errorBuilder,
      loadingBuilder: loaderBuilder,
      transitionBuilder: transitionBuilder,
      animationDuration: animationDuration,
      animationStart: animationStart,
      direction: direction,
      hideOnLoading: hideOnLoading,
      hideOnEmpty: hideOnEmpty,
      hideOnError: hideOnError,
      hideSuggestionsOnKeyboardHide: hideSuggestionsOnKeyboardHide,
      keepSuggestionsOnLoading: keepSuggestionsOnLoading,
      keepSuggestionsOnSuggestionSelected:
      keepSuggestionsOnSuggestionSelected,
      autoFlipDirection: autoFlipDirection,
      hideKeyboard: hideKeyboard,
      textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: decoration ??
              InputDecoration(
                label: Text(
                  label,
                  style: TextStyle(
                      color: false ? kColorAccent : kColorEditTextHint),
                ),
                prefix: prefix,
                suffix: suffix,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                counterText: "",
                contentPadding: contentPadding ?? const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                labelStyle: TextStyle(color: kColorEditTextHint),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kColorAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: kColorEditTextBorder, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kColorError, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kColorError, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: kColorEditTextBorder, width: 1.0),
                ),
              )));
}
