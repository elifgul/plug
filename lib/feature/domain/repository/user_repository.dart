import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plug/core/config/config_reader.dart';
import 'package:http/http.dart' as http;
import 'package:plug/feature/data/model/user_model.dart';
class UserRepository {

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    String apiUrl = 'http://localhost:8088/hys-web/api';
    final response = await http.get('$apiUrl/auth/login/$username/$password');

    if (response.statusCode != 200) {
      throw new Exception('Unable to get login from the REST API');
    }
    return parse(response.body).token;

    await Future.delayed(Duration(seconds: 0));
    return 'token';
  }

  static UserModel parse(String responseBody) {
    // decode: convert to map
    final parsed = json.decode(responseBody);
    if (parsed['status'] =='FAIL') {
      throw new Exception('Kullanıcı bulunamadı!');
    }
    return UserModel.fromJson(parsed['data']);
  }



  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 0));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 0));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 0));
    return false;
  }
}