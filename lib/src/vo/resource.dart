import '../../hudle_core.dart';
import 'error_response.dart';
import 'pagination_model.dart';

class Resource<T> {
  Status status;
  T? data;
  ErrorResource? onError;

  Resource._(this.status, this.data, this.onError);

  static Resource<T> error<T>(ErrorResource onError) {
    return Resource._(Status.ERROR, null, onError);
  }

  static Resource<T> success<T>(T data) {
    return Resource._(Status.SUCCESS, data, null);
  }

  static Resource<T> loading<T>() {
    return Resource._(Status.LOADING, null, null);
  }
}

enum Status { SUCCESS, ERROR, LOADING }

class ErrorResource {
  final String errorMessage;
  final int errorCode;
  final ValidationError? validationError;

  ErrorResource(this.errorMessage, {this.errorCode = -1, this.validationError});
}

extension DataResponse<T> on Future<BaseResponse> {

  Future<Resource<T>> toResource<T>() async {
    try {
      final response = await this;
      if (response.success) {
        return Resource.success(response.data);
      } else
        return Resource.error(ErrorResource(response.message,
            errorCode: response.code, validationError: response.errors));
    } catch (e) {
      return Resource.error(ErrorResource('$e'));
    }
  }

  @Deprecated("Use toResourcePaginate instead")
  Future<Resource<PaginationDataWrapper<T>>> resourcePaginateAsync<T>() async {
    final response = await this;
    if (response.success) {
      return Resource.success(PaginationDataWrapper<T>(response.data, response.meta));
    } else
      return Resource.error(ErrorResource(response.message, errorCode: response.code, validationError: response.errors));
  }

  Future<Resource<PaginationWrapper<T>>> toResourcePaginate<T>() async {
    final response = await this;
    if (response.success) {
      return Resource.success(PaginationWrapper<T>(response.data, response.meta));
    } else
      return Resource.error(ErrorResource(response.message, errorCode: response.code, validationError: response.errors));
  }

  @Deprecated("Use toResource instead")
  Future<Resource<T>> resourceAsync<T>() async {
    try {
      final response = await this;
      if (response.success) {
        return Resource.success(response.data);
      } else
        return Resource.error(ErrorResource(response.message,
            errorCode: response.code, validationError: response.errors));
    } catch (e) {
      return Resource.error(ErrorResource('$e'));
    }
  }
}
