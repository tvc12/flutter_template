import 'dart:io';

import 'package:ddi/module.dart';
import 'package:t_core/t_core.dart';
import 'package:dio/dio.dart';

class DevModule extends AbstractModule {
  @override
  void init() {
    bind('dio_client').to(_buildClient());
    // bind(Login)
  }

  HttpClient _buildClient() {
    final BaseOptions baseOption = BaseOptions(
      baseUrl: Config.getString("api_host"),
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: <String, dynamic>{
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );
    Dio dio = Dio(baseOption);
    return HttpClient(dio);
  }
}
