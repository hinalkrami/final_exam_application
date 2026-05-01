import 'package:dio/dio.dart';
import 'package:final_exam_application/features/auth/presentation/widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';
import '../services/app_notification.dart';
import 'dio_exception.dart';

class AppException implements Exception {
  String? message;
  String? prefix;

  AppException({this.message, this.prefix});

  @override
  String toString() {
    // TODO: implement toString
    return '$message $prefix';
  }

  static Future<void> handleApiCall({
    required BuildContext context,
    required Future<void> Function() apiCall,
    required int Function() statusCode,
    required String Function() message,
    String? body,
  }) async {
    void showNotification() {
      if (statusCode() == 200) {
        if (!context.mounted) return;
        AppNotification().showNotification(id: 1, title: message(), body: body ?? '');
      }
    }

    try {
      await apiCall();
      if (!context.mounted) return;
      showNotification();
    } on DioException catch (dioError) {
      String? errorMessage = DioExceptionUntil.handleError(dioError);
      if (!context.mounted) return;
      CustomWidgets.showSnackBar(errorMessage, context);
      debugPrint('DioError: $dioError');
    } on AppException catch (appError) {
      String? errorMessage = AppException().toString();
      if (!context.mounted) return;
      CustomWidgets.showSnackBar(errorMessage, context);
      debugPrint('AppError: $appError');
    } catch (e) {
      if (!context.mounted) return;
      CustomWidgets.showSnackBar('Something went wrong please try again later..', context);
      debugPrint('Error: ${e.toString()}');
    }
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
    : super(message: message, prefix: S.current.errorDuringCommunication);
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message: message, prefix: S.current.invalidRequest);
}

class InvalidInputException extends AppException {
  InvalidInputException(String message) : super(message: message, prefix: S.current.invalidInput);
}

class ServerSideException extends AppException {
  ServerSideException(String message) : super(message: message, prefix: S.current.serverSideError);
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
    : super(message: message, prefix: S.current.noActiveInternetconnection);
}
