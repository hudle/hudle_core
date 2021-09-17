import 'package:flutter/material.dart';
import 'package:hudle_theme/hudle_theme.dart';


class EditTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final double height;
  final bool enable;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffix;
  final Widget? suffixText;
  final TextInputType? keyboardType;
  final String? errorText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool readOnly;
  final bool showAsHint;
  final String? hint;
  final int? maxLines;
  final int? minLines;
  final bool alignLabelWithHint;

  EditTextField(
      {required this.labelText,
        this.controller,
        this.errorText,
        this.obscureText = false,
        this.height = 48,
        this.validator,
        this.hint,
        this.enable = true,
        this.contentPadding =
        const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        this.suffix,
        this.suffixText,
        this.keyboardType,
        this.onChanged,
        this.focusNode,
        this.maxLength,
        this.minLines,
        this.maxLines = 1,
        this.alignLabelWithHint = true,
        this.readOnly = false,
        this.showAsHint = false,
        this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height,
      child: TextFormField(
        readOnly: readOnly,
        maxLength: maxLength,
        obscureText: obscureText,
        enabled: enable,
        maxLines: maxLines,
        minLines: minLines,
        focusNode: focusNode,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          alignLabelWithHint: alignLabelWithHint,
          contentPadding: contentPadding,
          labelText: !showAsHint ? labelText : null,
          hintText: showAsHint ? labelText : hint,
          suffixIcon: suffix,
          suffix: suffixText,
          errorText: errorText,
          labelStyle:
          TextStyle(color: false ? kColorAccent : kColorEditTextHint),
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
        ),
      ),
    );
  }
}






///  Created by Syed Hussain Mehdi
///  14 April 2021 at 3:52 PM

typedef SuggestionTileBuilder<T> = Widget Function(
    int index,
    T option
    );

typedef MatchCriteriaBuilder<T> = Iterable<T>? Function(
    String value,
    TextEditingValue textEditingValue);

class AutoCompleteText<T extends Object> extends StatelessWidget {

  final String labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final ValueChanged<String> onTextChanged;
  final Iterable<T> iterable;
  final MatchCriteriaBuilder<T>? matchCriteriaBuilder;
  final SuggestionTileBuilder<T> suggestionTileBuilder;
  final AutocompleteOnSelected<T>? onSelected;
  final AutocompleteOptionToString<T> displayStringForOption;
  final Function? onFiledViewBuilder;

  AutoCompleteText({
    required this.labelText, this.errorText, required this.onTextChanged, this.keyboardType, this.matchCriteriaBuilder,
    required this.iterable, required this.suggestionTileBuilder, this.onSelected,
    this.onFiledViewBuilder
    ,
    required this.displayStringForOption
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      displayStringForOption: displayStringForOption,
      fieldViewBuilder: (context, textController, node, onFieldSubmitted) {

        onFiledViewBuilder?.call(node, textController);

        return EditTextField(
          labelText: labelText,
          keyboardType: keyboardType,
          controller: textController,
          focusNode: node,
          onFieldSubmitted: (v) {
            onFieldSubmitted();
          },
          onChanged: onTextChanged,
          errorText: errorText,
        );
      },
      optionsViewBuilder: (context, fun, Iterable<T> options ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Container(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final T option = options.elementAt(index);
                  return InkWell(
                    onTap: () {
                      fun(option);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: suggestionTileBuilder(index, option),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },

      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return Iterable<T>.empty();
        }

        final matchCriteria = matchCriteriaBuilder?.call(textEditingValue.text, textEditingValue);
        if (matchCriteria != null)
          return matchCriteria;

        return iterable.where((T option) {
          return option.toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: onSelected,
    );
  }
}
