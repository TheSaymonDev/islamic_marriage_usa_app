import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:islamic_marriage_usa_app/core/utils/api_response.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_logger.dart';
import 'package:islamic_marriage_usa_app/core/utils/app_urls.dart';
import 'package:islamic_marriage_usa_app/data/services/connectivity_service.dart';

class ApiService {
  Future<ApiResponse<dynamic>> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: 'Please check your internet connection'.toString(),
        ),
      );
    }
    AppLogger.logRequest(url, headers: headers ?? AppUrls.requestHeader);

    final response = await http.get(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    AppLogger.logResponse(response.statusCode, response.body);

    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> post({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(
      url,
      data: data,
      headers: headers ?? AppUrls.requestHeader,
    );

    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    AppLogger.logResponse(response.statusCode, response.body);
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> postWithOutData({
    required String url,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url, headers: headers ?? AppUrls.requestHeader);

    final response = await http.post(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    AppLogger.logResponse(response.statusCode, response.body);
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> postMultipart({
    required String url,
    required Map<String, dynamic> data,
    required File file,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url,
        data: data, headers: headers ?? AppUrls.requestHeader);
    AppLogger.logInfo('File: $file');

    final multipartRequest = http.MultipartRequest('POST', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);

    // Add data as a single field
    multipartRequest.fields['data'] = jsonEncode(data);

    // Add file
    String fileField = 'groomSelfieUrl';
    multipartRequest.files
        .add(await http.MultipartFile.fromPath(fileField, file.path));

    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    AppLogger.logResponse(streamResponse.statusCode, streamResponse.body);
    return _handleApiResponse(streamResponse);
  }

  Future<ApiResponse<dynamic>> put({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url,
        data: data, headers: headers ?? AppUrls.requestHeader);

    final response = await http.put(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    AppLogger.logResponse(response.statusCode, response.body);
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> putMultipart({
    required String url,
    required dynamic data,
    File? file,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url,
        data: data, headers: headers ?? AppUrls.requestHeader);
    if (file != null) {
      AppLogger.logInfo('File: $file');
    }

    final multipartRequest = http.MultipartRequest('PUT', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);
    data.forEach(
        (key, value) => multipartRequest.fields[key] = value.toString());

    if (file != null) {
      String fileField = 'photo';
      multipartRequest.files
          .add(await http.MultipartFile.fromPath(fileField, file.path));
    }

    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    AppLogger.logResponse(streamResponse.statusCode, streamResponse.body);
    return _handleApiResponse(streamResponse);
  }

  Future<ApiResponse<dynamic>> patch({
    required String url,
    required dynamic data,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url,
        data: data, headers: headers ?? AppUrls.requestHeader);

    final response = await http.patch(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
      body: jsonEncode(data),
    );

    AppLogger.logResponse(response.statusCode, response.body);
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> patchWithOutBody({
    required String url,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url, headers: headers ?? AppUrls.requestHeader);

    final response = await http.patch(Uri.parse(url),
        headers: headers ?? AppUrls.requestHeader);

    AppLogger.logResponse(response.statusCode, response.body);
    return _handleApiResponse(response);
  }

  Future<ApiResponse<dynamic>> patchMultipart({
    required String url,
    required dynamic data,
    File? file,
    required Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url,
        data: data, headers: headers ?? AppUrls.requestHeader);
    if (file != null) {
      AppLogger.logInfo('File: $file');
    }

    final multipartRequest = http.MultipartRequest('PATCH', Uri.parse(url));
    multipartRequest.headers.addAll(headers ?? AppUrls.requestHeader);
    data.forEach(
        (key, value) => multipartRequest.fields[key] = value.toString());

    if (file != null) {
      String fileField = 'profile';
      multipartRequest.files
          .add(await http.MultipartFile.fromPath(fileField, file.path));
    }

    final response = await multipartRequest.send();
    final streamResponse = await http.Response.fromStream(response);

    AppLogger.logResponse(streamResponse.statusCode, streamResponse.body);
    return _handleApiResponse(streamResponse);
  }

  Future<ApiResponse<dynamic>> delete({
    required String url,
    Map<String, String>? headers,
  }) async {
    if (!await ConnectivityService.isConnected()) {
      return Future.value(
        ApiResponse.error(
          statusCode: -1,
          message: {"message": 'Please check your internet connection'},
        ),
      );
    }
    AppLogger.logRequest(url, headers: headers ?? AppUrls.requestHeader);

    final response = await http.delete(
      Uri.parse(url),
      headers: headers ?? AppUrls.requestHeader,
    );

    AppLogger.logResponse(response.statusCode, response.body);
    return _handleApiResponse(response);
  }

  ApiResponse<dynamic> _handleApiResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse.success(data: jsonDecode(response.body));
    } else {
      AppLogger.logError(
          'API Error: Status ${response.statusCode}, Body: ${response.body}');
      return ApiResponse.error(
          statusCode: response.statusCode, message: jsonDecode(response.body));
    }
  }
}
