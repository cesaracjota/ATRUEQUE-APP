import 'dart:async';
import 'package:atrueque/core/api/base_api.dart';
import 'package:atrueque/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '${BaseAPI.baseURL}/user/sign/in',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        ToastHelper.showToast(
            msg: 'Inicio de sesion existoso',
            bgColor: Colors.green,
            textColor: Colors.white);
        bool accessToken = response.data['error'];
        // print(accessToken);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('token', accessToken);
        return accessToken;
      } else {
        String errorMessage = 'Error: ${response.data['msg']}';
        ToastHelper.showToast(
            msg: errorMessage, bgColor: Colors.red, textColor: Colors.white);
        return true;
      }
    } catch (error) {
      if (error is DioException && error.response?.statusCode != 200) {
        String errorMessage = error.response!.data['msg'];
        ToastHelper.showToast(
            msg: errorMessage, bgColor: Colors.red, textColor: Colors.white);
        print(errorMessage);
        return true;
      }

      print('Caught an error: $error');
      return true;
    }
  }

  // register

  Future<bool> regiter(String email, String password, String username) async {
    try {
      final response = await _dio.post(
        '${BaseAPI.baseURL}/user/sign/up',
        data: {
          'email': email,
          'password': password,
          'UserName': username,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        ToastHelper.showToast(
          msg: 'Registro de usuario existoso',
          bgColor: Colors.green,
          textColor: Colors.white,
        );

        bool accessToken = response.data['error'];
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setInt("accessToken", int.parse(accessToken));
        return accessToken;
      } else {
        String errorMsg = response.data['msg'];
        ToastHelper.showToast(
            msg: errorMsg, bgColor: Colors.red, textColor: Colors.white);
        return true;
      }
    } catch (error) {
      if (error is DioException && error.response?.statusCode == 500) {
        String errorMsg = error.response!.data['msg'];
        ToastHelper.showToast(
            msg: errorMsg, bgColor: Colors.red, textColor: Colors.white);
        return true;
      }

      print('Caught an error: $error');
      return true;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('access_token', token);
}
