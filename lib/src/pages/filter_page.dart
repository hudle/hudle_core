import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hudle_theme/hudle_theme.dart';

import '../../hudle_core.dart';

class FilterPage<T extends FilterController> extends StatefulWidget {
  const FilterPage({Key? key, required this.controller, required this.onReset, required this.onApply, this.title}) : super(key: key);

  final T controller;
  final Function onReset;
  final Function onApply;
  final String? title;

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return FilterInheritedWidget(
      controller: widget.controller,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorWhite,
          elevation: 0.5,
          leading: Container(),
          title: PrimaryTextMedium(widget.title ?? "Filters", fontSize: 20,),
        ),
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: _FilterOptionPage(onReset: widget.onReset,),
              ),
              Expanded(
                flex: 7,
                child: _FilterDataPage(onApply: widget.onReset,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterOptionPage extends StatelessWidget {
  const _FilterOptionPage({
    Key? key, required this.onReset,
  }) : super(key: key);

  final Function onReset;

  @override
  Widget build(BuildContext context) {
    final controller = FilterInheritedWidget.of(context)?.controller;

    return Container(
      color: Color(0xffF0F0F0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Obx(
                    () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller?.options
                        .map((e) => HudleFlatButton(

                      text: "${e.name}",
                      fontWeight: FontWeight.w500,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      color: controller.selectedOption.value.id == e.id
                          ? kColorWhite
                          : Color(0xffF0F0F0),
                      textColor: controller.selectedOption.value.id == e.id
                          ? kColorAccent
                          : kPrimaryText,

                      onPressed: () {
                        controller.updateSelection = e;
                      },
                    ),
                    )
                        .toList() ??
                        []),
              )),
          HudleFlatButton(
            text: "Reset",
            fontSize: 18,
            color: kColorPrimary,
            onPressed: () {
               onReset.call();
            },
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          )
        ],
      ),
    );
  }
}

class _FilterDataPage extends StatelessWidget {
  const _FilterDataPage({
    Key? key, required this.onApply,
  }) : super(key: key);

  final Function onApply;

  @override
  Widget build(BuildContext context) {

    final controller = FilterInheritedWidget.of(context)?.controller;

    return Container(
      color: kColorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PrimaryTextMedium(headingText),
                    // VerticalGap.v16,
                    Obx(() => Expanded(child: controller?.selectedOption.value.view ?? Container()))
                  ],
                ),
              )),
          HudleFlatButton(
            text: "Apply",
            fontSize: 18,
            onPressed: () {
              onApply.call();
            },
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          )
        ],
      ),
    );
  }
}


class FilterInheritedWidget extends InheritedWidget {
  final FilterController controller;

  FilterInheritedWidget({required Widget child, required this.controller})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static FilterInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FilterInheritedWidget>();
}


class FilterModel {
  final String name;
  final Widget view;
  final FilterId id;

  FilterModel({required this.name, required this.view, required this.id});
}

class FilterId {
  final String id;
  FilterId(this.id);
}

class FilterResult<T> {
   final T? data;
   FilterResult(this.data);
}

class FilterController extends GetxController {

  final List<FilterModel> options;
  late Rx<FilterModel> selectedOption;
  final selectedFilter = Map<FilterId, FilterResult?>().obs;

  FilterController(this.options, Map<FilterId, FilterResult?> selectedFilter, {FilterModel? selectedOption}) {
    assert (options.isNotEmpty);
    this.selectedOption = selectedOption != null ? selectedOption.obs : options[0].obs;
    this.selectedFilter.value = Map()..addAll(selectedFilter);
  }

  set updateSelection(FilterModel selected) => this.selectedOption.value = selected;
}