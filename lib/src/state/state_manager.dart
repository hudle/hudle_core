import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hudle_core/hudle_core.dart';
import 'package:hudle_theme/hudle_theme.dart';

class StateManager<ViewModel extends BaseViewModel> extends InheritedWidget {

  final ViewModel viewModel;

  StateManager({required Widget child, required this.viewModel}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static StateManager<T>? of<T extends BaseViewModel>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<StateManager<T>>();
}



abstract class BaseViewModel extends GetxController {
  var _loadingInfo =  false.obs;//LoadingInfo(false).obs;
  late Rx<ErrorResource?> _error = ErrorResource("").obs;
  final validationError = ValidationError().obs;
  final canShowErrorPage = false.obs;
  final hasError = false.obs;
  var hasNoData = false.obs;

  final paginationLoader = false.obs;

  Rx<bool> get loader => _loadingInfo;
  Rx<ErrorResource?> get error => _error;


  void notifyLoading(bool isLoading, {String message = "Please wait..", bool newLoader = false, bool paginate = false}) {

    if (paginate) {
      paginationLoader.value = isLoading;
      return;
    }

    if(newLoader) _loadingInfo = isLoading.obs;
    else _loadingInfo.value =  isLoading;
  }

  void notifyError(ErrorResource? resource) {
    _error.value = resource;
    hasError.value = true;
    log("Error: ${resource?.errorMessage} with Error Code: ${resource?.errorCode}");

    if (resource?.errorCode == -1 && kDebugMode) {
      showErrorDialog(resource);
    }

    if (resource?.errorCode == 422) {
      validationError.value = resource?.validationError ?? ValidationError();
    }
  }

  void notifyShowErrorPage(bool show) {
    canShowErrorPage.value = show;
  }

  void clearError() => hasError.value = false;

  void clearValidation() => validationError.value = ValidationError();

}

void showErrorDialog(ErrorResource? errorResource, {String title = "Error"}) {
  Get.dialog(AlertDialog(
    title: Text(title),
    content: Text(errorResource?.errorMessage ?? "Something error"),
    actions: [
      TextButton(onPressed: () {
        Get.back();
      }, child: NormalText("Ok", color: kColorAccent,))
    ],
  ));
}