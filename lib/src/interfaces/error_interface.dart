
import 'package:hudle_core/src/vo/error_response.dart';
import 'package:hudle_core/src/vo/resource.dart';

abstract class ErrorInterface {

  void onValidationError(ValidationError validationError);

  void onUnauthorizedAccess(ErrorResource errorResource);

  void onForbiddenError(ErrorResource errorResource);

  void onNotFound(ErrorResource errorResource);

  void showOtherError(ErrorResource errorResource);

  void onError(ErrorResource errorResource);
}