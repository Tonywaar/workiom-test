import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:workiom/export.dart';

class DataService {
  final dio.Dio _dio;

  DataService(this._dio);

  Future<DataState<GeneralResponse<T>>> getData<T>({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(
        DataConsts.baseUrl + endPoint,
        options: dio.Options(headers: headers()),
        queryParameters: queryParameters,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on dio.DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<GeneralResponse<T>>> postData<T>({
    dynamic data,
    required String endPoint,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(
        DataConsts.baseUrl + endPoint,
        options: dio.Options(headers: headers()),
        data: data,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on dio.DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<GeneralResponse<T>>> postFormData<T>({
    required dio.FormData formData,
    required String endPoint,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(
        DataConsts.baseUrl + endPoint,
        options: dio.Options(headers: headers(isForm: true), contentType: 'multipart/form-data'),
        data: formData,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on dio.DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<GeneralResponse<T>>> deleteData<T>({
    dynamic data,
    required String endPoint,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.delete(
        DataConsts.baseUrl + endPoint,
        options: dio.Options(headers: headers()),
        data: data,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on dio.DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<GeneralResponse<T>>> putData<T>({
    dynamic data,
    required String endPoint,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.put(
        DataConsts.baseUrl + endPoint,
        options: dio.Options(headers: headers()),
        data: data,
      );
      return handleDataState(response: response, fromJson: fromJson);
    } on dio.DioException catch (error) {
      return handleDataState(response: error.response, fromJson: fromJson);
    }
  }

  Future<DataState<GeneralResponse<T>>> handleDataState<T>({
    required dio.Response? response,
    required Function(Map<String, dynamic>) fromJson,
  }) async {
    if (response != null) {
      if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
        var general = GeneralResponse<Map<String, dynamic>>.fromJson(response.data);
        var result = fromJson(general.result ?? {});
        final finalResponse = GeneralResponse<T>(
          bAbp: general.bAbp,
          error: general.error,
          result: result,
          success: general.success,
          targetUrl: general.targetUrl,
          unAuthorizedRequest: general.unAuthorizedRequest,
        );
        return DataSuccess(finalResponse);
      } else if (response.statusCode == HttpStatus.unauthorized) {
        if (UserService.instance.isAuthenticated) {
          UserService.instance.clearUserData();
          Get.offAllNamed(Routes.HOME);
        }
      }
    }
    return DataFailed(
      dio.Response(
        data: response?.data['error'] ?? response?.data['message'] ?? 'unknown error',
        statusCode: response?.statusCode,
        requestOptions: response?.requestOptions ?? dio.RequestOptions(),
      ),
    );
  }
}