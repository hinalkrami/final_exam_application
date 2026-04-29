import 'dart:async';

import 'package:final_exam_application/core/api/dio_client.dart';
import 'package:get_it/get_it.dart';

GetIt locators = GetIt.instance;

Future<void> setupLocators() async {
  await DioClient().provider();
}
