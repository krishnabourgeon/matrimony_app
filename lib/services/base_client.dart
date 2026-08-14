import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:matrimony_app/services/app_config.dart';
import 'package:matrimony_app/services/helpers.dart';
import 'package:matrimony_app/services/shared_preference_helper.dart';
import 'app_exceptions.dart';
import 'package:async/async.dart';

class BaseClient {
  static final BaseClient _instance = BaseClient._internal();
  factory BaseClient() => _instance;
  BaseClient._internal();
  static const int timeDuration = 20;
  static Future<String> get token async {
    return AppConfig.accessToken == null
        ? await SharedPreferenceHelper.getToken()
        : AppConfig.accessToken!;
  }

  static const String _appJson = 'application/json';
  static Map<String, String> commonHeaders = {
    'Content-Type': 'application/json',
    //HttpHeaders.contentTypeHeader: 'application/json',
  };
  //GET METHOD
  static Future<dynamic> get(String api, {Map<String, String>? map}) async {
    String bearerToken = await token;
    String queryString = Uri(queryParameters: map ?? {}).query;
    var uri;
    if (map != null) {
      uri = Uri.parse('${AppConfig.baseUrl}$api?$queryString');
    } else {
      uri = Uri.parse(AppConfig.baseUrl + api);
    }
    bool check = await isInternetAvailable();
    if (check) {
      try {
        var response = await http
            .get(
              uri,
              headers: {
                HttpHeaders.contentTypeHeader: _appJson,
                HttpHeaders.acceptHeader: _appJson,
                HttpHeaders.authorizationHeader: 'Bearer $bearerToken',
              },
            )
            .timeout(const Duration(seconds: timeDuration));
        return _processResponse(response);
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
          'API not responded in time',
          uri.toString(),
        );
      }
    }
  }

  //POST METHOD
  static Future<dynamic> post(String api, {dynamic body}) async {
    String bearerToken = await token;
    print('POST $api -> bearer token: ${bearerToken.isEmpty ? "EMPTY (not authenticated)" : "present"}');

    var uri = Uri.parse(AppConfig.baseUrl + api);
    bool check = await isInternetAvailable();
    if (check) {
      try {
        var response = await http
            .post(
              uri,
              headers: {
                HttpHeaders.contentTypeHeader: _appJson,
                HttpHeaders.acceptHeader: _appJson,
                HttpHeaders.authorizationHeader: 'Bearer $bearerToken',
              },
              body: body != null ? json.encode(body) : null,
            )
            .timeout(const Duration(seconds: timeDuration));
        // print(response.statusCode);
        // print(response.body);
        return _processResponse(response);
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
          'API not responded in time',
          uri.toString(),
        );
      }
    }
  }

  //POST MULTIPART METHOD (file uploads, e.g. photos)
  static Future<dynamic> postMultipart(
    String api, {
    Map<String, String>? fields,
    Map<String, File>? files,
  }) async {
    String bearerToken = await token;
    var uri = Uri.parse(AppConfig.baseUrl + api);
    bool check = await isInternetAvailable();
    if (check) {
      try {
        var request = http.MultipartRequest('POST', uri);
        // Do NOT set Content-Type manually — http.MultipartRequest sets the
        // multipart/form-data boundary itself; overriding it breaks parsing.
        request.headers[HttpHeaders.acceptHeader] = _appJson;
        request.headers[HttpHeaders.authorizationHeader] = 'Bearer $bearerToken';
        if (fields != null) request.fields.addAll(fields);
        if (files != null) {
          for (final entry in files.entries) {
            request.files.add(await http.MultipartFile.fromPath(entry.key, entry.value.path));
          }
        }
        var streamedResponse = await request.send().timeout(const Duration(seconds: timeDuration));
        var response = await http.Response.fromStream(streamedResponse);
        return _processResponse(response);
      } on SocketException {
        throw FetchDataException('No Internet connection', uri.toString());
      } on TimeoutException {
        throw ApiNotRespondingException(
          'API not responded in time',
          uri.toString(),
        );
      }
    }
  }

  static dynamic _processResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        // var responseJson = utf8.decode(response.bodyBytes);
        return Result.value(jsonDecode(response.body));
      case 201:
        // var responseJson = utf8.decode(response.bodyBytes);
        return Result.value(jsonDecode(response.body));
      case 400:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 401:
      case 403:
        return Result.value(jsonDecode(response.body));
      case 422:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 500:
      default:
        // Some backends send a validation-style JSON body even on status
        // codes we don't otherwise special-case (e.g. a 302 with an
        // "errors"/"message" body instead of a real redirect). Pass the raw
        // body through so callers can still parse the real reason instead of
        // just seeing "Error occured with code : 302".
        final body = utf8.decode(response.bodyBytes);
        throw FetchDataException(
          body.isNotEmpty ? body : 'Error occured with code : ${response.statusCode}',
          response.request!.url.toString(),
        );
    }
  }

  static Future<bool> isInternetAvailable({bool enableToast = true}) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        if (enableToast) Helpers.successToast("No Internet");
        return false;
      }
    } on SocketException catch (_) {
      if (enableToast) Helpers.successToast("No Internet");
      return false;
    }
  }
}
