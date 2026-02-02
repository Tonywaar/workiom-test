import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:workiom/app/routes/app_pages.dart';

import '../core/services/user_service.dart';
import 'data_consts.dart';
import 'data_state.dart';

class DataService {
  final dio.Dio _dio;

  DataService(this._dio);

  Future<DataState<T>> getData<T>({
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

  Future<DataState<T>> postData<T>({dynamic data, required String endPoint, required Function(Map<String, dynamic>) fromJson}) async {
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

  Future<DataState<T>> postFormData<T>({
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

  Future<DataState<T>> deleteData<T>({dynamic data, required String endPoint, required Function(Map<String, dynamic>) fromJson}) async {
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

  Future<DataState<T>> putData<T>({dynamic data, required String endPoint, required Function(Map<String, dynamic>) fromJson}) async {
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

  Future<DataState<T>> handleDataState<T>({required dio.Response? response, required Function(Map<String, dynamic>) fromJson}) async {
    if (response != null) {
      if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
        final object = fromJson(response.data);
        return DataSuccess(object as T);
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