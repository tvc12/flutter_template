import 'dart:async';

import 'package:dio/dio.dart';

class HttpClient {
  static const String TAG = "HttpClient";
  Dio _dio;

  HttpClient(this._dio);

  Future<dynamic> get(String path,{ Map<String, dynamic > params, Options options})  {
    return _dio.get(path, 
    queryParameters: params??<String,dynamic>{},
    options: options == null? Options(responseType: ResponseType.plain) : options
    ).then((response) {
      return _handleResult(response);
    }).catchError((e) {
      _handleError(path,e);
    });
  }


  Future<dynamic> post(String path, dynamic body,
      {Map<String, dynamic > params, ProgressCallback onSendProgress, Options options}) {
    return _dio.post(
        path,
        queryParameters: params??<String,dynamic>{},
        data: body,
        onSendProgress: onSendProgress,
    options: options == null? Options(responseType: ResponseType.plain): options
    ).then((response) {
      return _handleResult(response);
    }).catchError((e,stackTrace) {
      _handleError(path,e);
      print(stackTrace);
    });
  }


  Future<dynamic> put(String path, dynamic body, {Options options})  {
    return _dio.put(path, 
    data: body,
    options: options ?? Options(responseType: ResponseType.plain)
    ).then((response) {
      return _handleResult(response);
    }).catchError((e,stackTrace) {
      _handleError(path,e);
    });
  }


  Future<dynamic> delete(String path,{Options options})  {
    return _dio.delete(path, 
    options: options ?? Options(responseType: ResponseType.plain)
    ).then((response) {
      return _handleResult(response);
    }).catchError((e) {
      _handleError(path,e);
    });
  }

  dynamic _handleResult(Response response) {
    // try{
    //   Map<String,dynamic> json = jsonDecode(response.data);
    //   if(!json['success']) {
    //     throw new XedAPIException.fromJson(json['error']);
    //   }
    //   return json['data'];
    // }on XedAPIException catch(e) {
    //   throw e;
    // }catch(e) {
    //   throw XedAPIException.from(e);
    // }
  }

  void _handleError(String path, DioError e) {
    // try{
    //   print(path + ": " + e.toString());
    //   if(e.response!=null && e.response.data !=null) {
    //     Map<String,dynamic> json = jsonDecode(e.response.data);
    //     throw new XedAPIException.fromJson(json['error']);
    //   } else {
    //     throw XedAPIException.from(e);
    //   }
    // }on XedAPIException catch(e) {
    //   throw e;
    // }catch(e) {
    //   throw XedAPIException.from(e);
    // }
  }
}