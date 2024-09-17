import 'dart:async';

import 'package:dio/dio.dart';
import 'package:product_viewer/utils/logger.dart';

class DioLoggingInterceptors extends InterceptorsWrapper {
  final log = getLogger(DioLoggingInterceptors);

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log.d('[${options.method}] ${options.uri}');
    log.t('Request data: ${options.data}');
    return handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    log.e('--- onError ---');
    log.e('[${err.requestOptions.method}] ${err.requestOptions.uri}');
    log.e('${err.message}');
    log.e('---------------');
    super.onError(err, handler);
  }
}
