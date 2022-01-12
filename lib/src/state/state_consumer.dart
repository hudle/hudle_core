import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hudle_core/hudle_core.dart';
import 'package:hudle_core/src/dialogs/hudle_dialogs.dart';

import 'state_manager.dart';


///CREATED BY: SYED HUSSAIN MEHDI
const  ERROR_CODES_PAGE = [401,403,404,500, /*ErrorCode.COULD_NOT_CONNECT, ErrorCode.TIME_OUT*/];

typedef NoDataWidgetBuilder = Widget Function();

class GetXMainBody extends StatelessWidget implements ErrorInterface {
  final Widget child;
  final Widget? loader;
  final Function? onRetry;
  final Function? onOtherError;
  final bool showErrorPage;
  final bool showNoDataPage;
  final String? noDataTitle;
  final String? noDataSubtitle;
  final Widget? noDataImage;
  final Rx<bool>? loaderValue;
  final Function? onValidationErrorCallback;
  final Function? onForbiddenErrorCallback;
  final Function? onUnauthorizedErrorCallback;
  final Function? onNotFoundCallback;
  final List<int> showErrorPageOnlyForCode;
  final List<int> avoidErrorPageOnlyForCode;
  final NoDataWidgetBuilder? noDataWidgetBuilder;
  final bool disableMaxHeight;
  final BaseViewModel controller;

  GetXMainBody(
      {required this.child,
        required this.controller,
        this.loader,
        this.onRetry,
        this.noDataWidgetBuilder,
        this.onOtherError,
        this.noDataImage,
        this.noDataSubtitle,
        this.noDataTitle,
        this.loaderValue,
        this.onUnauthorizedErrorCallback,
        this.onValidationErrorCallback,
        this.onForbiddenErrorCallback,
        this.onNotFoundCallback,
        this.avoidErrorPageOnlyForCode = const [],
        this.showErrorPageOnlyForCode = ERROR_CODES_PAGE,
        this.disableMaxHeight = false,
        this.showNoDataPage = true,
        this.showErrorPage = true})
       {
    controller.validationError.listen((value) {
      onValidationError(value);
    });

    controller.error.listen((value) {
      onError(value!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StateManager(
      viewModel: controller,
      child: Container(
        height: !disableMaxHeight ? MediaQuery.of(context).size.height : null,
        child: Stack(
          children: [
            GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus(); //hide if keyboard is open
                },
                child: child),
            Obx(() => Visibility(
                visible: showErrorPage
                    && controller.hasError.value
                    && showErrorPageOnlyForCode.contains(controller.error.value?.errorCode)
                    && !avoidErrorPageOnlyForCode.contains(controller.error.value?.errorCode)
                    && controller.error.value?.errorCode != 422,
                child: ErrorPage(
                  textError: "Oops",
                  textMessage: kReleaseMode ? controller.error.value?.errorCode == -1 ? "Unexpected error" :  controller.error.value?.errorMessage ??
                      "Something went wrong" : controller.error.value?.errorMessage ??
                      "Something went wrong",
                  showRetryButton: onRetry != null,
                  onRetryTap: () {
                    controller.clearError();
                    onRetry?.call();
                  },
                ))),
            Obx(() => Visibility(
                visible: showNoDataPage && controller.hasNoData.value,
                child: noDataWidgetBuilder?.call() ??
                    ErrorPage(
                      textError: noDataTitle ?? "No Data",
                      textMessage:
                      noDataSubtitle ?? "data is empty",
                    ))),
            Obx(
                  () => Visibility(
                  visible: loaderValue != null ? loaderValue?.value ?? false : controller.loader.value,
                  child: Positioned.fill(
                      child: AbsorbPointer(
                        child: loader ??
                            Container(
                              color: Colors.black12,
                              child: progressDialog(),
                            ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onError(ErrorResource errorResource) {

    switch (errorResource.errorCode) {
      case 401:
        onUnauthorizedAccess(errorResource);
        break;
      case 422:
        onValidationError(errorResource.validationError!);
        break;
      case 403:
        onForbiddenError(errorResource);
        break;
      case 404:
        onNotFound(errorResource);
        break;
      default:
        showOtherError(errorResource);
        break;
    }
  }

  @override
  void onForbiddenError(ErrorResource errorResource) {
    onForbiddenErrorCallback?.call(errorResource);
  }

  @override
  void onNotFound(ErrorResource errorResource) {
    onNotFoundCallback?.call(errorResource);
  }

  @override
  void onUnauthorizedAccess(ErrorResource errorResource) async{
    onUnauthorizedErrorCallback?.call();
    // showLogoutDialog();
    // await SessionManager.instance.logout();
    // Get.offAllNamed(LoginPage.ROUTE);
  }

  @override
  void onValidationError(ValidationError validationError) {
    if (kDebugMode && validationError.fcmIdArray.errorValue != null) {
      Get.snackbar("Required", validationError.fcmIdArray.errorValue!);
    }

    onValidationErrorCallback?.call(validationError);
  }

  @override
  void showOtherError(ErrorResource errorResource) {
    if (errorResource.errorCode == 400) {
      if (errorResource.errorMessage != null) {
       showSnack(message: errorResource.errorMessage);
      }
    }
    onOtherError?.call(errorResource);
  }
}