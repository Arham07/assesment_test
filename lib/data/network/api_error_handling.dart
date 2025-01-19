import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../exception/app_exceptions.dart';

errorHandling(DioException e) async {
  if (e.response != null) {
    debugPrint("DIO EXCEPTION IF Condition");
    debugPrint("==================DIO ERROR API RESPONSE==================");
    debugPrint("DioExceptionData ==> ${e.response!.data}");
    debugPrint("DioExceptionHeader ==> ${e.response!.headers}");
    debugPrint("DioExceptionStatusCode ==> ${e.response!.statusCode}");
    debugPrint("DioExceptionRequestOption ==> ${e.response!.requestOptions}");

    /// Error Handling
    if (e.response?.statusCode == 400) {
      // throw ScaffoldMessenger.of(Get.context!).showSnackBar(
      //   CustomSnackBar(
      //     backgroundColor: Colors.red,
      //     message: "${e.response?.data['message']}",
      //   ),
      // );
    } else if (e.response?.statusCode == 401) {
      debugPrint("object ==> ${e.response?.statusCode}");
      // await Get.defaultDialog(
      //   title: "Session Expired",
      //   content: const Padding(
      //     padding: EdgeInsets.all(12.0),
      //     child: Text(
      //       "Your session is expired. Please login again",
      //       style: TextStyle(color: Colors.white),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      //   actions: [
      //     ElevatedButton(
      //         onPressed: () async {
      //           await removeUser();
      //           Get.offAllNamed(AppRoutes.authentication);
      //         },
      //         child: const Text("Ok")),
      //   ],
      //   onWillPop: () async {
      //     return await false;
      //   },
      // );
      throw UnAuthorizeException(e.response!.data['message']);
    } else if (e.response?.statusCode == 404) {
      throw NotFoundException(e.response!.data['message']);
    } else if (e.response!.statusCode! >= 500 &&
        e.response!.statusCode! < 600) {
      throw ApiExceptions(
          "Oops! Something went wrong. Our team is working to fix the issue. Please try again later.",
          "Server Error");
    } else if (e is SocketException) {
      throw NoInternetException('No Internet Connection');
    } else if (e is TimeoutException) {
      throw NoInternetException('Network Request Time Out');
    } else {
      throw ApiExceptions(e.response!.data['message']);
    }
  } else {
    debugPrint("DIO EXCEPTION ELSE Condition");
    if (kDebugMode) {
      print("DioExceptionRequestOptionInElse ==>${e
      }");
    }
    debugPrint(e.message);
    throw ApiExceptions(e.message);
  }
}