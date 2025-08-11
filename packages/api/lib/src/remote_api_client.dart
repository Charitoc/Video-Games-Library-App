import 'package:dio/dio.dart';
// import 'package:fresh_dio/fresh_dio.dart';

abstract class RemoteApiClientBase {
  // Stream<AuthenticationStatus> get authenticationStatus;
  Future<void> setToken(String? token);

  Future<void> clearToken();

  Future<void> setRefreshToken(String refreshToken);

  Future<void> clearRefreshToken(String refreshToken);

  assertClientInitialized();

  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> getTyped<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<Map<String, dynamic>>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> postTyped<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<Map<String, dynamic>>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<Map<String, dynamic>>> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });
}
