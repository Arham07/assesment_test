import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../../configs/storage/shared_preference.dart';
import '../exception/app_exceptions.dart';
import 'apiUrls/api_constants.dart';
import 'api_error_handling.dart';
import 'base_api_services.dart';

class NetworkApiService implements BaseApiServices {
  late Dio dio;
  late BaseOptions baseOptions;

  NetworkApiService() {
    baseOptions = BaseOptions(
      baseUrl: ApiConstants.mainUrl,
    );
    dio = Dio(baseOptions);
  }

  dioInterceptors() async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) async {
        // Do something with response error
        if (e.response?.statusCode == 401) {
          // Navigate to the login screen
          // You can use Navigator to navigate to your login screen
          // For example:
          // Navigator.pushReplacementNamed(context, '/login');
          // await removeUser();
          // Get.Get.offAllNamed(AppRoutes.authentication);
          print('Token expired, navigate to login screen');
        }
        return handler.next(e); //continue
      },
    ));
  }

  @override
  Future GetResponse(
      {required String url,
      bool isTokenRequired = true,
      Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameter}) async {
    try {
      debugPrint("==================API REQUEST==================");
      debugPrint("GetRequest URL: ${baseOptions.baseUrl + url}");
      var token;
      if (isTokenRequired) {
        token = await SharedPrefService.getToken();
        print("token ==> $token");
      }
      var response = await dio
          .get(
            url,
            data: data,
            queryParameters: queryParameter,
            options: Options(
              headers: {
                "Authorization":
                    "Bearer ${token}"
              },
            ),
          )
          .timeout(const Duration(seconds: 20));
      debugPrint("==================API RESPONSE==================");
      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      if (e.response != null) {
        dioInterceptors();
        debugPrint(
            "==================DIO ERROR API RESPONSE==================");
        print("data ==> ${e.response!.data}");
        print("header ==> ${e.response!.headers}");
        print("requestOptions ==> ${e.response!.requestOptions}");
        print("statusCode ==> ${e.response!.statusCode}");
        throw ApiExceptions(e.response!.statusCode);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        throw ApiExceptions(e.message);
      }
    }
  }

  @override
  Future PostResponse(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameter,
      bool isTokenRequired = true}) async {
    try {
      var token;
      if (isTokenRequired) {
        token = await SharedPrefService.getToken();
        print("token ==> $token");
      }
      debugPrint("==================API REQUEST==================");
      debugPrint("Request URL: ${baseOptions.baseUrl + url}");
      var response = await dio
          .post(
            url,
            data: data,
            queryParameters: queryParameter,
            options: Options(
              headers: {"Authorization": "Bearer $token"},
            ),
          )
          .timeout(const Duration(seconds: 20));
      //
      debugPrint("==================API RESPONSE==================");
      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
      dioInterceptors();
    }
  }

  @override
  Future PostFormResponse(
      {required String url,
      required FormData data,
      bool isTokenRequired = true}) async {
    try {
      var token;
      if (isTokenRequired) {
        token = await SharedPrefService.getToken();
        print("token ==> $token");
      }
      debugPrint("==================API REQUEST==================");
      debugPrint("Request URL: ${baseOptions.baseUrl + url}");
      var response = await dio
          .post(
            url,
            data: data,
            options: Options(
              headers: {"Authorization": "Bearer $token"},
            ),
          )
          .timeout(const Duration(seconds: 20));

      debugPrint("==================API RESPONSE==================");
      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
    }
  }

  @override
  Future PutResponse(
      {required String url,
      required Map<String, dynamic> data,
      bool isTokenRequired = true}) async {
    try {
      var token;
      if (isTokenRequired) {
        // token = ApiConstants.userData?.data?.token;
        // token = await getUser().then((value) {
        //   return value?.data?.token;
        // });
      }
      // debugPrint("user token: $token");
      debugPrint("==================API REQUEST==================");
      debugPrint("Request URL: ${baseOptions.baseUrl + url}");
      var response = await dio
          .put(
            url,
            data: data,
            options: Options(
              headers: {"Authorization": "Bearer $token"},
            ),
          )
          .timeout(const Duration(seconds: 20));

      // debugPrint("==================API RESPONSE==================");
      // debugPrint(response.statusCode.toString());
      // debugPrint(response.data.toString());
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
    }
  }

  Future PutResponseFormData(
      {required String url,
      required FormData data,
      bool isTokenRequired = true}) async {
    try {
      var token;
      if (isTokenRequired) {
        // token = ApiConstants.userData?.data?.token;
        print("token ==> $token");
        // token = await getUser().then((value) {
        //   return value?.data?.token;
        // });
      }
      // debugPrint("user token: $token");
      debugPrint("==================API REQUEST==================");
      debugPrint("Request URL: ${baseOptions.baseUrl + url}");
      var response = await dio
          .put(
            url,
            data: data,
            options: Options(
              headers: {"Authorization": "Bearer $token"},
            ),
          )
          .timeout(const Duration(seconds: 20));

      // debugPrint("==================API RESPONSE==================");
      // debugPrint(response.statusCode.toString());
      // debugPrint(response.data.toString());
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
    }
  }
}
