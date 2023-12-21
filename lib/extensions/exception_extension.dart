import 'package:dio/dio.dart';

extension ExceptionUtilities on Object {
  Exception formatException() {
    if (this is DioError) {
      return Exception('${(this as DioError).response?.statusMessage}');
    } else {
      throw this;
    }
  }
}