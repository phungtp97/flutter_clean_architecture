import 'package:dio/dio.dart';
import '../../extensions/extension.dart';
import '../../utils/utils.dart';

typedef JsonParser<T> = T Function(Map<String, dynamic> map);

abstract class BaseResponse<T> {
  int statusCode;
  ErrorResponse? error;
  T? item;
  bool get success => statusCode == 200 || statusCode == 201;

  BaseResponse({this.statusCode = 0});
}

class SingleResponse<T> extends BaseResponse {
  Response<T> response;

  SingleResponse(this.response, {int? statusCode}) : super(statusCode: statusCode ?? 0);

  @override
  bool get success => response.statusCode == 200 || response.statusCode == 201;

  SingleResponse.fromJson(this.response, JsonParser<T> parser) {
    statusCode = response.statusCode ?? 0;
    final map = JsonUtils.getMap(response.data);
    if (success) {
      item = parser(map);
    } else {
      error = ErrorResponse.fromJson(map);
    }
  }
}

class ErrorResponse {
  String error;
  String errorMessage;
  String data;
  List<ErrorMessageResponse> errorMessageList;

  ErrorResponse({
    required this.error,
    required this.errorMessageList,
    required this.errorMessage,
    required this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    var errorList = <ErrorMessageResponse>[];
    var errorMessage = '';
    var data = '';

    if (json["message"] is List) {
      final message = List<dynamic>.from((json["message"] ?? []).map((x) => x));
      final firstMessage = message.firstOrDefault();
      if (firstMessage != null) {
        errorList = List<ErrorMessageResponse>.from(
          (firstMessage["message"] ?? []).map(
            (x) => ErrorMessageResponse.fromJson(x),
          ),
        );
      }
    } else if (json["message"] is String) {
      errorMessage = json["message"];
    }
    return ErrorResponse(
      error: json['error'] ?? '',
      errorMessageList: errorList,
      errorMessage: errorMessage,
      data: data,
    );
  }
}

class ErrorMessageResponse {
  String id;
  String message;

  ErrorMessageResponse({required this.id, required this.message});

  factory ErrorMessageResponse.fromJson(Map<String, dynamic> json) => ErrorMessageResponse(
        id: json['errorMessage'] ?? '',
        message: json['errorCode'] ?? '',
      );
}
