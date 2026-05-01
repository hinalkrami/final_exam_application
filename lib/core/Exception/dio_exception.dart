import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import '../../generated/l10n.dart';

class DioExceptionUntil {
  static String handleError(DioException error) {
    String errorMessage = 'Unknown Error';
    debugPrint(error.toString());
    switch (error.type) {
      case DioExceptionType.unknown:
        errorMessage = S.current.somethingWentWrongTryAgainAfterSomeTimes;
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = S.current.connectionTimeOutWithServer;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = S.current.requestCanNotBeHandleTryAfterSometimes;
        break;

      case DioExceptionType.receiveTimeout:
        errorMessage = S.current.requestCanNotBeHandleTryAfterSometimes;
        break;

      case DioExceptionType.badCertificate:
        errorMessage = S.current.requestCanNotBeHandleTryAfterSometimes;
        break;
      case DioExceptionType.badResponse:
        debugPrint("Response:");
        debugPrint(error.toString());
        if (error.response!.statusCode == 12039 || error.response!.statusCode == 12040) {
          errorMessage = S.current.connectionTimeOutWithServer;
        } else if (401 == error.response!.statusCode) {
          errorMessage = S.current.pleaseLoginAgain;
        } else if (401 < error.response!.statusCode! && error.response!.statusCode! <= 417) {
          errorMessage = S.current.somethingWentWrongTryAgainAfterSomeTimes;
        } else if (500 <= error.response!.statusCode! && error.response!.statusCode! <= 505) {
          errorMessage = S.current.requestCanNotBeHandleTryAfterSometimes;
        } else {
          errorMessage = S.current.requestCanNotBeHandleTryAfterSometimes;
        }
        errorMessage = S.current.somethingWentWrongTryAgainAfterSomeTimes;
        break;
      case DioExceptionType.cancel:
        errorMessage = S.current.requestedServerIsCanceled;
        break;
      case DioExceptionType.connectionError:
        errorMessage = S.current.connectionTimeOutWithServer;
        break;
    }
    return errorMessage;
  }
}
