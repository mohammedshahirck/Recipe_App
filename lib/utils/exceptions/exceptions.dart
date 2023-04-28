import 'dart:async';
import 'dart:io';

import 'package:chefskart/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exceptions {
  static void errorHandler(Object e) {
    if (e is PlatformException) {
      Toasts.showToast('Platform Error Occured', Colors.red);
    }
    if (e is SocketException) {
      Toasts.showToast('No Internet Connection', Colors.red);
    } else if (e is TimeoutException) {
      Toasts.showToast('Connection Timeout', Colors.black);
    } else if (e is MissingPluginException) {
      Toasts.showToast('Pluggin error occured', Colors.grey);
    } else if (e is DioError) {
      if (e.response?.data['message'] != null) {
        Toasts.showToast(e.response!.data['message'].toString(), Colors.grey);
      } else if (e.type == DioErrorType.connectionTimeout) {
        Toasts.showToast('Connection timedout', Colors.grey);
      } else if (e.type == DioErrorType.receiveTimeout) {
        Toasts.showToast('Response timedout', Colors.grey);
      } else if (e.type == DioErrorType.cancel) {
        Toasts.showToast('Request cancelled', Colors.grey);
      } else if (e.type == DioErrorType.sendTimeout) {
        Toasts.showToast('Request timedout', Colors.grey);
      } else if (e.error is SocketException) {
        Toasts.showToast('No Internet Connection', Colors.grey);
      }
    }
  }
}
