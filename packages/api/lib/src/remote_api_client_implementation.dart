// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'remote_api_client.dart';

const baseUrl = 'https://api.igdb.com/v4/';

class RemoteApiClientImplementation extends RemoteApiClientBase {
  RemoteApiClientImplementation({
    TokenStorage<String?>? tokenStorage,
  })  : _fresh = Fresh<String?>(
          refreshToken: (token, httpClient) async {
            return null;
          },
          tokenHeader: (String? token) {
            return {
              'Client-ID': dotenv.env['CLIENT_ID'] ?? '',
              'Authorization': 'Bearer $token',
            };
          },
          tokenStorage: tokenStorage ?? InMemoryTokenStorage<String>(),
        ),
        _dio = Dio(
          BaseOptions(
            // ignore: lines_longer_than_80_chars
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 20),
            receiveTimeout: const Duration(seconds: 20),
            contentType: 'application/json',
            responseType: ResponseType.json,
            headers: <String, String>{
              'Authorization': 'Bearer ${tokenStorage?.read()}',
              'Accept': 'application/json',
              'Accept-Language': '',
              'api_key': '',
            },
          ),
        ) {
    _dio.httpClientAdapter = IOHttpClientAdapter();
    _dio.interceptors.addAll([
      _fresh,
      InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.statusCode == 200 &&
              response.data is String &&
              response.data.toString().isEmpty) {
            response.data = {'status': 200};
          }
          return handler.next(response);
        },
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          if (err.response!.statusCode == 401) {
            final res = await post('https://id.twitch.tv/oauth2/token',
                queryParameters: {
                  'client_id': dotenv.env['CLIENT_ID'],
                  'client_secret': dotenv.env['CLIENT_SECRET'],
                  'grant_type': 'client_credentials',
                });

            // Clone the original request
            final options = err.requestOptions;

            // Mark request to avoid infinite retry loop
            options.extra['retry'] = true;

            setToken(res.data!.values.first);

            // Retry the request
            final response = await _dio.fetch(options);
            return handler.resolve(response); // Send the response back
          }

          return handler.next(
            DioException.connectionError(
                requestOptions: RequestOptions(), reason: 'errorrrr'),
          );
        },
      )
    ]);
  }

  final Dio _dio;
  final Fresh _fresh;

  @override
  assertClientInitialized() {
    // throw UnimplementedError();
  }

  @override
  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response<T>> getTyped<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    assertClientInitialized();
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    assertClientInitialized();
    return _dio.post<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> postTyped<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    assertClientInitialized();
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    assertClientInitialized();
    return _dio.put<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    assertClientInitialized();
    return _dio.delete<Map<String, dynamic>>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<void> clearRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('refresh_token');
  }

  @override
  Future<void> clearToken() => _fresh.clearToken();

  @override
  Future<void> setRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh_token', refreshToken);
  }

  @override
  Future<void> setToken(String? token) => _fresh.setToken(token);
}
