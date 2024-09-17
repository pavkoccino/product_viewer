import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:product_viewer/core/constants.dart';
import 'package:product_viewer/core/controllers/log_interceptor.dart';
import 'package:product_viewer/utils/logger.dart';

typedef JSON = Map<String, dynamic>;

class BaseController {
  final _log = getLogger(BaseController);
  late final Dio _dio;

  BaseController() {
    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
    );
    _dio.interceptors.addAll([
      DioLoggingInterceptors(),
    ]);
  }

  Future<String> getString(String path, {Map<String, dynamic>? params}) async {
    _log.t('GET: $path');

    final Response response = await _dio.get(
      path,
      queryParameters: _cleanMap(params),
    );

    final dynamic data = await _getResponseData(response);
    if (data is String) {
      return data;
    } else {
      throw Exception('Expected a String response but got ${data.runtimeType}');
    }
  }

  Future<JSON> getJson(String path, {Map<String, dynamic>? params}) async {
    _log.t('GET: $path');

    final Response response = await _dio.get(
      path,
      queryParameters: _cleanMap(params),
    );
    return await _getResponseData(response) as JSON;
  }

  Future<dynamic> getDynamicRequest(String path, {Map<String, dynamic>? params}) async {
    _log.t('GET: $path');

    final Response response = await _dio.get(
      path,
      queryParameters: _cleanMap(params),
    );
    return _getResponseData(response);
  }

  Future<List<JSON>> getJsonList(String path, {Map<String, dynamic>? params}) async {
    _log.t('GET: $path');

    final Response response = await _dio.get(
      path,
      queryParameters: _cleanMap(params),
    );
    final responseData = await _getResponseData(response) as List<dynamic>;
    return responseData.map((i) => i as JSON).toList();
  }

  Future<dynamic> postDynamicRequest(String path, {dynamic data, Map<String, dynamic>? params}) async {
    _log.t('POST: $path');

    final Response response = await _dio.post(
      path,
      queryParameters: _cleanMap(params),
      data: jsonEncode(data),
    );
    return _getResponseData(response);
  }

  Future<JSON?> postJson(String path, {dynamic data, Map<String, dynamic>? params}) async {
    _log.t('POST: $path');

    final Response response = await _dio.post(
      path,
      queryParameters: _cleanMap(params),
      data: jsonEncode(data),
    );
    return await _getResponseData(response) as JSON?;
  }

  Future<bool> putJson(String path, {Map<String, dynamic>? params, dynamic data}) async {
    _log.t('PUT: $path');

    final Response response = await _dio.put(
      path,
      queryParameters: _cleanMap(params),
      data: jsonEncode(data),
    );
    return _isRequestOK(response);
  }

  Future<JSON> putJsonWithResponse(String path, {Map<String, dynamic>? params, dynamic data}) async {
    _log.t('PUT: $path');

    final Response response = await _dio.put(
      path,
      queryParameters: _cleanMap(params),
      data: data,
    );
    return await _getResponseData(response) as JSON;
  }

  Future<JSON> patchJson(String path, {Map<String, dynamic>? params, dynamic data}) async {
    _log.t('PATCH: $path');

    final Response response = await _dio.patch(
      path,
      queryParameters: _cleanMap(params),
      data: jsonEncode(data),
    );
    return await _getResponseData(response) as JSON;
  }

  Future<bool> deleteJson(String path, {Map<String, dynamic>? params, dynamic data}) async {
    _log.t('DELETE: $path');

    final Response response = await _dio.delete(
      path,
      queryParameters: _cleanMap(params),
      data: data,
    );
    return _isRequestOK(response);
  }

  Future<dynamic> _getResponseData(Response response) async {
    _log.t(response.requestOptions.uri);
    _log.t(response.requestOptions.data);
    _log.t(response.data);

    try {
      if (response.statusCode == 200) {
        _log.t('Request OK with data!');
        return response.data;
      } else if (response.statusCode == 204) {
        _log.t('Request OK with no data!');
        return null;
      } else {
        _log.d(response.statusCode);
        return Future<dynamic>.error({});
      }
    } catch (err) {
      _log.e(err);
      return Future<dynamic>.error(err);
    }
  }

  Future<bool> _isRequestOK(Response response) async {
    try {
      if (response.statusCode == 200) {
        _log.t('Request OK with data!');
        return true;
      } else if (response.statusCode == 204) {
        _log.t('Request OK with no data!');
        return true;
      } else {
        _log.d(response.statusCode);
        return Future<bool>.error({});
      }
    } catch (err) {
      _log.e(err);
      return Future<bool>.error(err);
    }
  }

  /// Remove null values from map
  Map<String, dynamic>? _cleanMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }
    final Map<String, dynamic> cleanedMap = {};
    map.forEach((key, value) {
      if (value != null) {
        cleanedMap[key] = value;
      }
    });
    return cleanedMap;
  }
}
